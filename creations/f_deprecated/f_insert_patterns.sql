CREATE OR REPLACE FUNCTION insert_patterns (
    IN ipattern varchar(16)
) RETURNS void AS
$BODY$
    BEGIN
        -- check if the pattern exists
        IF EXISTS( SELECT 1 FROM patterns WHERE description = ipattern ) THEN
            RAISE EXCEPTION 'suits( % ) exists', ipattern;
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO patterns ( id, description )
            VALUES ( DEFAULT, ipattern );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
