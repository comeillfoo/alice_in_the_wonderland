CREATE OR REPLACE FUNCTION coronate (
    IN new_leader_id integer
) RETURNS integer AS
$BODY$
    DECLARE
        old_leader_ids integer[] := ARRAY( SELECT id FROM leaders WHERE kingdom_reign_enddate IS NULL AND fk_kingdom_id = ( SELECT fk_kingdom_id FROM leaders WHERE id = new_leader_id ) );
        -- old_leader_crown_ids integer[] := ARRAY( SELECT fk_crown_id FROM leaders WHERE id IN old_leader_id );
    BEGIN
        UPDATE leaders
        SET kingdom_reign_enddate = CURRENT_DATE
        WHERE id = ANY( old_leader_ids );

        UPDATE leaders
        SET kingdom_reign_enddate = NULL
        WHERE id = new_leader_id;

        RETURN 1;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;