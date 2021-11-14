CREATE OR REPLACE FUNCTION expired_registrations_delete (
) RETURNS void AS
$BODY$
    DECLARE
        expired_passes ARRAY[]::integer[];
    BEGIN
        SELECT id FROM registrations WHERE expiry_date < CURRENT_DATE INTO expired_passes;
        DELETE FROM residences WHERE fk_registration_id = ANY( expired_passes ); 
        -- DELETE FROM registrations WHERE id = ANY( expired_passes );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
