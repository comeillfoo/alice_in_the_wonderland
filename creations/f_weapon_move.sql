CREATE OR REPLACE FUNCTION weapon_move (
    IN customer integer,
    IN item_id integer,
    IN dest_kingdom integer
) RETURNS void AS
$BODY$
    BEGIN
        IF EXISTS( SELECT 1 FROM weapons WHERE id = item_id AND fk_kingdom_id = dest_kingdom AND fk_resident_id = customer ) THEN
            RAISE INFO 'weapons ( % ) is already registered in desired kingdom', item_id;
            RETURN;
        END IF;
        
        UPDATE weapons
        SET
            fk_kingdom_id = dest_kingdom
        WHERE id = item_id AND fk_resident_id = customer;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;