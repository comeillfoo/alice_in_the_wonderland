CREATE OR REPLACE FUNCTION weapon_owner_check(
) RETURNS trigger AS
$weapon_owner_check$
    DECLARE
        soldier_resident_role varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=NEW.fk_resident_id );
    BEGIN
        IF ( soldier_resident_role <> 'солдат' OR soldier_resident_role IS NULL ) THEN
            RAISE EXCEPTION 'only residents with special role can have weapons';
        END IF;

        RETURN NEW;
    END;
$weapon_owner_check$
LANGUAGE plpgsql;

CREATE TRIGGER weapon_owner_check BEFORE INSERT OR UPDATE ON weapons
    FOR EACH ROW EXECUTE PROCEDURE weapon_owner_check();
