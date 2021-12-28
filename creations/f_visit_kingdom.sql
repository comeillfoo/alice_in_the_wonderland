CREATE OR REPLACE FUNCTION visit_kingdom (
    IN resident integer,
    IN spandays integer,
    IN dest_kingdom integer
) RETURNS integer AS
$BODY$
    DECLARE
        is_already_live_here boolean := EXISTS( SELECT 1 FROM registrations WHERE fk_kingdom_id = dest_kingdom AND ( expiry_date IS NULL OR expiry_date > CURRENT_DATE ) AND id IN ( SELECT fk_registration_id FROM residences WHERE fk_resident_id = resident ) );
        guest_pass_id integer;
    BEGIN
        IF spandays < 0 THEN
            RAISE EXCEPTION 'time travels not supported yet; invalid the span of visitting ( % )', spandays;
        END IF;

        IF is_already_live_here THEN
            RAISE INFO 'residents( % ) already registered to desired kingdom', resident;
            RETURN;
        END IF;

        INSERT INTO registrations VALUES ( DEFAULT, dest_kingdom, CURRENT_DATE, CURRENT_DATE + spandays * INTERVAL '1 day' ) RETURNING id INTO guest_pass_id;
        INSERT INTO residences VALUES ( resident, guest_pass_id );
        RETURN 1;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;