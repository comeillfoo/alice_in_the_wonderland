CREATE OR REPLACE FUNCTION worships_check(
) RETURNS trigger AS 
$worships_check$
    DECLARE
        leader_resident_id integer := ( SELECT id FROM residents WHERE id = ( SELECT fk_resident_id FROM leaders WHERE id = NEW.fk_leader_id ) );
        courtier_resident_role varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=NEW.fk_courtier_id );
    BEGIN
        -- check if trying to serve themself
        IF ( leader_resident_id = NEW.fk_courtier_id ) THEN
            RAISE EXCEPTION 'leaders cant serve themself [ leader_id: % ]', NEW.fk_leader_id;
        END IF;

        -- check if courtier is 'придворный'
        IF ( courtier_resident_role <> 'придворный' OR courtier_resident_role IS NULL ) THEN
            RAISE EXCEPTION 'only residents with the special role can worship their leader';
        END IF;

        RETURN NEW;
    END;
$worships_check$
LANGUAGE plpgsql;

CREATE TRIGGER worships_check BEFORE INSERT OR UPDATE ON worships
    FOR EACH ROW EXECUTE PROCEDURE worships_check();
