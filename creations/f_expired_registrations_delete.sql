CREATE OR REPLACE FUNCTION expired_registrations_delete (
) RETURNS void AS
$BODY$
    BEGIN
        DELETE FROM registrations WHERE expiry_date < CURRENT_DATE CASCADE; 
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
