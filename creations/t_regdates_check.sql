CREATE OR REPLACE FUNCTION regdates_check(
) RETURNS trigger AS
$regdates_check$
    BEGIN
        IF NEW.issue_date > NEW.expiry_date THEN
            RAISE EXCEPTION 'time travels are not supported yet by mankind';
        END IF;

        RETURN NEW;
    END;
$regdates_check$
LANGUAGE plpgsql;

CREATE TRIGGER regdates_check BEFORE INSERT OR UPDATE ON registrations
    FOR EACH ROW EXECUTE PROCEDURE regdates_check();
