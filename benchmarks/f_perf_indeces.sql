CREATE OR REPLACE FUNCTION perf_indeces (
) RETURNS void AS
$BODY$
    DECLARE
        count integer := 1000;
        some RECORD;
    BEGIN
        LOOP
            SELECT * FROM leaders WHERE kingdom_reign_enddate IS NOT NULL INTO some;
            SELECT * FROM clothes WHERE fk_type_name IN ( SELECT name FROM types ) INTO some;
            SELECT * FROM tools WHERE fk_kingdom_id IN ( SELECT id FROM kingdoms ) INTO some;
            SELECT * FROM weapons WHERE fk_kingdom_id IN ( SELECT id FROM kingdoms ) INTO some;
            count := count - 1;
            IF count <= 0 THEN
                EXIT;
            END IF;
        END LOOP;

    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;