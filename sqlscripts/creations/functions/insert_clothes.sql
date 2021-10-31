CREATE OR REPLACE FUNCTION insert_clothes (
    IN resident integer DEFAULT NULL,
    IN pattern integer DEFAULT 0,
    IN colour text DEFAULT 'GreenYellow',
    IN density integer DEFAULT 0,
    IN type_nm text DEFAULT 'торс'
) RETURNS void AS
$BODY$
    BEGIN
        -- check if resident exists
        IF resident IS NOT NULL AND NOT EXISTS( SELECT 1 FROM residents WHERE id = resident ) THEN
            RAISE EXCEPTION E'residents( % ) doesn\'t exist', resident;
            -- TODO: insert non-existing row if it able
        END IF;

        -- check if pattern exists
        IF NOT EXISTS( SELECT 1 FROM patterns WHERE id = pattern ) THEN
            RAISE EXCEPTION E'patterns( % ) doesn\'t exist', pattern;
            -- TODO: insert non-existing row if it able
        END IF;

        -- check if colour exists
        IF NOT EXISTS( SELECT 1 FROM colours WHERE name = colour ) THEN
            RAISE EXCEPTION E'colours( % ) doesn\'t exist', colour;
            -- TODO: insert non-existing row if it able
        END IF;

        -- check if type exists
        IF NOT EXISTS( SELECT 1 FROM types WHERE name = type_nm ) THEN
            RAISE EXCEPTION E'types( % ) doesn\'t exist', type_nm;
            -- TODO: insert non-existing row if it able
        END IF;

        -- otherwise insert valid data into table
        INSERT INTO clothes ( id, fk_resident_id, fk_pattern_id, fk_colour_name, density, fk_type_name )
            VALUES ( DEFAULT, resident, pattern, colour, density, type_nm );
    END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
