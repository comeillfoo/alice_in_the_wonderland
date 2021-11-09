CREATE OR REPLACE FUNCTION weapons_check() RETURNS trigger AS $weapons_check$
        DECLARE
                kingdom_weapon text;
                resident_weapon text;
        BEGIN
                SELECT residents.id FROM residents WHERE residents.id=NEW.fk_resident_id INTO resident_weapon;
                SELECT kingdoms.id FROM kingdoms WHERE kingdoms.id=NEW.fk_kingdom_id INTO kingdom_weapon;
                IF ( leader_weapon IS NULL or kingdom_weapon IS NULL ) THEN
                        RAISE EXCEPTION '( resident: %; kingdom: % )', resident_weapon, kingdom_weapon;
                END IF;

                RETURN NEW;
        END;

$weapons_check$ LANGUAGE plpgsql;


CREATE TRIGGER weapons_check BEFORE INSERT OR UPDATE ON weapons
        FOR EACH ROW EXECUTE PROCEDURE weapons_check();












