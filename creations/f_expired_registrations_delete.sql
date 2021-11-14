CREATE OR REPLACE FUNCTION expired_registrations_delete (
) RETURNS void AS
$BODY$
    DECLARE
        removed_passes_id integer[];
    BEGIN
        DELETE FROM registrations WHERE expiry_date < CURRENT_DATE RETURNING id INTO removed_passes_id;

        DELETE FROM residences WHERE fk_registration_id IN removed_passes_id; 
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
