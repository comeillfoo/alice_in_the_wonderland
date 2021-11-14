CREATE OR REPLACE FUNCTION insert_kingdoms (
    IN isuit varchar(16) DEFAULT 'черви',
    IN inumber integer DEFAULT 0
) RETURNS void AS
$BODY$
    BEGIN
        -- check if the resident exists
        IF NOT EXISTS( SELECT 1 FROM suits WHERE name = isuit ) THEN
            RAISE EXCEPTION 'suits( % ) not exists', isuit;
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO kingdoms ( id, fk_suit_name, number_of_residents )
            VALUES ( DEFAULT, isuit, inumber );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
