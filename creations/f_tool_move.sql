CREATE OR REPLACE FUNCTION tool_move (
    IN customer integer,
    IN item_id integer,
    IN dest_kingdom integer
) RETURNS void AS
$BODY$
    BEGIN
        IF EXISTS( SELECT 1 FROM tools WHERE id = item_id AND fk_kingdom_id = dest_kingdom AND fk_resident_id = customer ) THEN
            RAISE INFO 'tools ( % ) is already registered in desired kingdom', item_id;
            RETURN;
        END IF;
        
        UPDATE tools
        SET
            fk_kingdom_id = dest_kingdom
        WHERE id = item_id AND fk_resident_id = customer;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;