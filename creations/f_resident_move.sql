CREATE OR REPLACE FUNCTION resident_move (
    IN resident integer,
    IN dest_kingdom integer
) RETURNS integer AS
$BODY$
    DECLARE
        old_registration_id integer := ( SELECT id FROM registrations WHERE id IN ( SELECT fk_registration_id FROM residences WHERE fk_resident_id = resident ) AND expiry_date IS NULL );
        new_registration_id integer;
        weapon RECORD;
        tool RECORD;
    BEGIN
        IF EXISTS( SELECT 1 FROM registrations WHERE id = old_registration_id AND fk_kingdom_id = dest_kingdom ) THEN
            RAISE EXCEPTION 'residents( % ) is already registered in desired kingdom', resident;
        END IF;

        DELETE FROM residences WHERE fk_resident_id = resident AND fk_registration_id = old_registration_id;
        INSERT INTO registrations VALUES ( DEFAULT, dest_kingdom, now(), NULL ) RETURNING id INTO new_registration_id;
        INSERT INTO residences VALUES ( resident, new_registration_id );
        DELETE FROM residences WHERE fk_resident_id = resident AND fk_registration_id IN ( SELECT id FROM registrations WHERE fk_kingdom_id = dest_kingdom AND expiry_date IS NOT NULL );

        IF ( 'солдат' = ( SELECT fk_role_name FROM residents WHERE id = resident ) ) THEN
            -- move all weapons
            FOR weapon IN SELECT * FROM weapons WHERE fk_resident_id = resident
            LOOP
                PERFORM weapon_move( resident, weapon.id, dest_kingdom );
            END LOOP;
        END IF;

        IF ( 'садовник' = ( SELECT fk_role_name FROM residents WHERE id = resident ) ) THEN
            -- move all tools
            FOR tool IN SELECT * FROM tools WHERE fk_resident_id = resident
            LOOP
                PERFORM tool_move( resident, tool.id, dest_kingdom );
            END LOOP;
        END IF;
	RETURN 1;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
