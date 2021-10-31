CREATE OR REPLACE FUNCTION insert_gaits (
    IN iname text DEFAULT 'неопознана',
    IN iresident integer DEFAULT NULL
) RETURNS void AS
$BODY$
    BEGIN

        -- check if the resident exists
        IF NOT EXISTS( SELECT 1 FROM residents WHERE id = iresident ) THEN
            RAISE WARNING 'residents( % ) not exists', iresident;
            iresident := max( id ) FROM residents;
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO gaits ( id, name, fk_resident_id )
            VALUES ( DEFAULT, iname, iresident );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
