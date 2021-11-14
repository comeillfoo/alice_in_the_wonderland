CREATE OR REPLACE FUNCTION clothes_check(
) RETURNS trigger AS
$clothes_check$
    DECLARE
        maybe_crown_id integer := ( SELECT id FROM crowns WHERE fk_clothes_id=NEW.id );
        resident_role varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=NEW.fk_resident_id );
    BEGIN
        IF ( ( maybe_crown_id IS NOT NULL ) AND ( resident_role IS NOT NULL ) AND ( resident_role <> 'правитель' ) ) THEN
            RAISE EXCEPTION 'only residents with the special role can wear a crown';
        END IF;

        RETURN NEW;
    END;
$clothes_check$
LANGUAGE plpgsql;

CREATE TRIGGER clothes_check BEFORE INSERT OR UPDATE ON clothes
    FOR EACH ROW EXECUTE PROCEDURE clothes_check();
