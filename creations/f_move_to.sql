CREATE OR REPLACE FUNCTION move_to (
    IN resident integer,
    IN dest_kingdom integer
) RETURNS void AS
$BODY$
    DECLARE
        old_registration_id integer := ( SELECT id FROM registrations WHERE id IN ( SELECT fk_registration_id FROM residences WHERE fk_resident_id = resident ) AND expiry_date IS NULL );
        new_registration_id integer;
    BEGIN
        IF EXISTS( SELECT 1 FROM registrations WHERE id = old_registration_id AND fk_kingdom_id = dest_kingdom ) THEN
            RAISE INFO 'residents( % ) is already registrated in desired kingdom', resident;
            RETURN;
        END IF;

        DELETE FROM residences WHERE fk_resident_id = resident AND fk_registration_id = old_registration_id;
        INSERT INTO registrations VALUES ( DEFAULT, dest_kingdom, now(), NULL ) RETURNING id INTO new_registration_id;
        INSERT INTO residences VALUES ( resident, new_registration_id ); 
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;