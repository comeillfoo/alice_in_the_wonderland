CREATE OR REPLACE FUNCTION insert_colour (
    IN cname text,
) RETURNS void AS
$BODY$
    BEGIN
        -- check if resident exists
        IF cname IS NULL OR EXISTS( SELECT 1 FROM colours WHERE name LIKE cname ) THEN
            RAISE EXCEPTION E'colours( % ) is null or already exists', cname;
            -- TODO: insert non-existing row if it able
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO colours ( name )
            VALUES ( cname );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
