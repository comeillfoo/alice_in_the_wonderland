CREATE OR REPLACE FUNCTION worships_check() RETURNS trigger AS $worships_check$
    DECLARE
        leader_resident_id integer;
    BEGIN
        SELECT id FROM residents WHERE id = ( SELECT fk_resident_id FROM leaders WHERE id = NEW.fk_leader_id ) into leader_resident_id;
        IF ( leader_resident_id = NEW.fk_resident_id ) THEN
            RAISE EXCEPTION 'leaders cant serve themself [ leader_id: % ]', NEW.fk_leader_id;
        END IF;
        RETURN NEW;
    END;
$worships_check$ LANGUAGE plpgsql;

CREATE TRIGGER worships_check BEFORE INSERT OR UPDATE ON worships
    FOR EACH ROW EXECUTE PROCEDURE worships_check();
