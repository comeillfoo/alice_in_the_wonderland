CREATE OR REPLACE FUNCTION cloth_buy (
    IN customer integer,
    IN item_id integer
) RETURNS void AS
$BODY$
    BEGIN
        IF EXISTS( SELECT 1 FROM clothes WHERE id = item_id AND fk_resident_id IS NOT NULL AND fk_resident_id <> customer ) THEN
            RAISE EXCEPTION 'clothes ( % ) already belongs to another resident, first sell the item', item_id; 
        END IF; 
        
        UPDATE clothes
        SET
            fk_resident_id = customer
        WHERE id = item_id;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;