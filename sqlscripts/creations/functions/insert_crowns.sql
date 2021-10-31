CREATE OR REPLACE FUNCTION insert_crowns (
    IN ivalue integer DEFAULT 0,
    IN iclothes integer DEFAULT 0
) RETURNS void AS
$BODY$
    BEGIN
        -- if null assign to 0
        IF ivalue IS NULL THEN
            ivalue := 0;
        END IF;

        -- check if the clothes_id already in inappropriate use
        IF EXISTS( SELECT 1 FROM crowns WHERE fk_clothes_id = iclothes ) OR
        EXISTS( SELECT 1 FROM clothes WHERE id = iclothes AND fk_type_name != 'головной убор' ) THEN
            RAISE EXCEPTION 'clothes( % ) already linked to crown or cloth dont have appropriate type', iclothes;
        END IF;

        IF NOT EXISTS( SELECT 1 FROM clothes WHERE id = iclothes ) THEN
            SELECT "insert_clothes"( type_nm => 'головной убор' );
            iclothes := max( id ) FROM clothes;
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO crowns ( id, value, fk_clothes_id )
            VALUES ( DEFAULT, ivalue, iclothes );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
