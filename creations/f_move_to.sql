CREATE OR REPLACE FUNCTION move_to (
    IN resident integer,
    IN dest_kingdom integer
) RETURNS void AS
$BODY$
    DECLARE
        old_registration RECORD := ( SELECT * FROM registrations WHERE id IN ( SELECT fk_registration_id FROM residences WHERE fk_resident_id = resident ) AND expiry_date IS NULL );
        new_registration_id integer;
    BEGIN
        IF old_registration.fk_kingdom_id = dest_kingdom THEN
            RAISE INFO 'residents( % ) is already registrated in desired kingdom', resident;
            RETURN;
        END IF;

        DELETE FROM residences WHERE fk_resident_id = resident AND fk_registration_id = old_registration.id;
        new_registration_id := ( INSERT INTO registrations VALUES ( DEFAULT, dest_kingdom, now(), NULL ) RETURNING id );
        INSERT INTO residences VALUES ( resident, new_registration_id ); 
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;