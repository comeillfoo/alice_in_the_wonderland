CREATE OR REPLACE FUNCTION insert_leaders(
	IN i_kingdom_id integer DEFAULT 1,
	IN i_kingdom_enddate date DEFAULT NULL,
	IN i_resident_id integer DEFAULT 1,
	IN i_crown_id integer DEFAULT NULL
) RETURNS void AS
$BODY$

	BEGIN
	--check kingdom id
	IF NOT EXISTS(SELECT 1 FROM kingdoms where kingdoms.id = i_kingdom_id) THEN
		RAISE EXCEPTION 'kingdom id (%) not exists', i_kingdom_id;
	END IF;

	--check resident id
	IF NOT EXISTS(SELECT 1 FROM residents where residents.id = i_resident_id) THEN
                RAISE EXCEPTION 'resident id (%) not exists', i_resident_id;
        END IF;
	--check resident and kingdom suit ?

	INSERT INTO LEADERS(id, fk_kingdom_id, kingdom_reign_enddate, fk_resident_id, fk_crown_id)
		VALUES(DEFAULT, i_kingdom_id, i_kingdom_enddate, i_resident_id, i_crown_id);

	END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;
