CREATE OR REPLACE FUNCTION cloth_sell (
    IN customer integer,
    IN item_id integer
) RETURNS void AS
$BODY$
    BEGIN
        IF NOT EXISTS( SELECT 1 FROM clothes WHERE id = item_id AND fk_resident_id = customer ) THEN
            RAISE EXCEPTION 'clothes ( % ) of residents( % ) does not exist', item_id, customer; 
        END IF; 
        
        UPDATE clothes
        SET
            fk_resident_id = NULL
        WHERE id = item_id AND fk_resident_id = customer;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;