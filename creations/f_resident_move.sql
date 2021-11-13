CREATE OR REPLACE FUNCTION resident_move (
    IN resident integer,
    IN dest_kingdom integer
) RETURNS void AS
$BODY$
    DECLARE
        old_registration_id integer := ( SELECT id FROM registrations WHERE id IN ( SELECT fk_registration_id FROM residences WHERE fk_resident_id = resident ) AND expiry_date IS NULL );
        new_registration_id integer;
    BEGIN
        IF EXISTS( SELECT 1 FROM registrations WHERE id = old_registration_id AND fk_kingdom_id = dest_kingdom ) THEN
            RAISE INFO 'residents( % ) is already registered in desired kingdom', resident;
            RETURN;
        END IF;

        DELETE FROM residences WHERE fk_resident_id = resident AND fk_registration_id = old_registration_id;
        INSERT INTO registrations VALUES ( DEFAULT, dest_kingdom, now(), NULL ) RETURNING id INTO new_registration_id;
        INSERT INTO residences VALUES ( resident, new_registration_id );

        IF ( 'солдат' = ( SELECT fk_role_id FROM residents WHERE id = resident ) ) THEN
            -- move all weapons
            FOR weapon IN SELECT * FROM weapons WHERE fk_resident_id = resident
            LOOP
                PERFORM weapon_move( resident, weapon.id, dest_kingdom );
            END LOOP;
        END IF;

        IF ( 'садовник' = ( SELECT fk_role_id FROM residents WHERE id = resident ) ) THEN
            -- move all tools
            FOR tool IN SELECT * FROM tools WHERE fk_resident_id = resident
            LOOP
                PERFORM tool_move( resident, tool.id, dest_kingdom );
            END LOOP;
        END IF;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;