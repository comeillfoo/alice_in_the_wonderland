CREATE OR REPLACE FUNCTION leader_role_check(
) RETURNS trigger AS
$leader_role_check$
    DECLARE
        leader_resident_role varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=NEW.fk_resident_id );
    BEGIN
        -- check if resident has the special role
        IF ( leader_resident_role <> 'правитель' OR leader_resident_role IS NULL ) THEN
            RAISE EXCEPTION 'only residents with special role can be leaders';
        END IF;

        RETURN NEW;
    END;
$leader_role_check$
LANGUAGE plpgsql;

CREATE TRIGGER leader_role_check BEFORE INSERT OR UPDATE ON leaders
    FOR EACH ROW EXECUTE PROCEDURE leader_role_check();
