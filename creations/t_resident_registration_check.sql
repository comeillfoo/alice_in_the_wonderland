CREATE OR REPLACE FUNCTION resident_registration_check(
) RETURNS trigger AS
$resident_registration_check$
    DECLARE
        resident_id integer := NEW.fk_resident_id;
        resident_registration registrations;
    BEGIN
        SELECT * FROM registrations WHERE id = NEW.fk_registration_id INTO resident_registration;
        
        IF ( resident_registration.expiry_date IS NULL ) THEN
            IF ( EXISTS( SELECT * FROM residences JOIN registrations ON residences.fk_registration_id = registrations.id WHERE fk_resident_id = resident_id AND expiry_date IS NULL ) ) THEN
                RAISE EXCEPTION 'residents ( % ) already has permanent residence permit, please withdraw the old one', resident_id;
            END IF;
        END IF;

        RETURN NEW;
    END;
$resident_registration_check$
LANGUAGE plpgsql;

CREATE TRIGGER resident_registration_check BEFORE INSERT OR UPDATE ON residences
    FOR EACH ROW EXECUTE PROCEDURE resident_registration_check();
