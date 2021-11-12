CREATE OR REPLACE FUNCTION coronate (
    IN new_leader_id integer
) RETURNS void AS
$BODY$
    DECLARE
        old_leader_id integer := ( SELECT id FROM leaders WHERE kingdom_reign_enddate IS NULL AND fk_kingdom_id = ( SELECT fk_kingdom_id FROM leaders WHERE id = new_king_id ) );
        old_leader_crown_id integer := ( SELECT fk_crown_id FROM leaders WHERE id = old_leader_id );
    BEGIN
        UPDATE leaders
        SET kingdom_reign_enddate = CURRENT_DATE, fk_crown_id = NULL
        WHERE id = old_leader_id;

        UPDATE leaders
        SET kingdom_reign_enddate = NULL, fk_crown_id = old_leader_crown_id
        WHERE id = new_leader_id;
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;