CREATE OR REPLACE FUNCTION tool_owner_check(
) RETURNS trigger AS
$tool_owner_check$
    DECLARE
        gardener_resident_role varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=NEW.fk_resident_id );
    BEGIN
        IF ( gardener_resident_role <> 'садовник' OR gardener_resident_role IS NULL ) THEN
            RAISE EXCEPTION 'only residents with special role can have tools';
        END IF;

        RETURN NEW;
    END;
$tool_owner_check$
LANGUAGE plpgsql;

CREATE TRIGGER tool_owner_check BEFORE INSERT OR UPDATE ON tools
    FOR EACH ROW EXECUTE PROCEDURE tool_owner_check();
