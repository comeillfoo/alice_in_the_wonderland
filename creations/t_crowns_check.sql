CREATE OR REPLACE FUNCTION crowns_check(
) RETURNS trigger AS
$crowns_check$
    DECLARE
        maybe_leader_role_name varchar( 24 ) := ( SELECT fk_role_name FROM residents WHERE id=( SELECT fk_resident_id FROM clothes WHERE id=NEW.fk_clothes_id ) );
    BEGIN
        -- check if cloth for crown has the proper type
        IF ( 'головной убор' <> ( SELECT fk_type_name FROM clothes WHERE id=NEW.fk_clothes_id ) ) THEN
            RAISE EXCEPTION 'clothes ( % ) is not a hat', NEW.fk_clothes_id;
        END IF;

        -- check if crown owner is a leader
        IF ( maybe_leader_role_name <> 'правитель' OR maybe_leader_role_name IS NULL ) THEN
            RAISE EXCEPTION 'invalid crown owner role name ( expected: правитель; actual: % )', maybe_leader_role_name;
        END IF;

        RETURN NEW;
    END;
$crowns_check$
LANGUAGE plpgsql;

CREATE TRIGGER crowns_check BEFORE INSERT OR UPDATE ON crowns
    FOR EACH ROW EXECUTE PROCEDURE crowns_check();
