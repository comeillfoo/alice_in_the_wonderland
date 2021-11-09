CREATE OR REPLACE FUNCTION tools_check() RETURNS trigger AS $tools_check$
	DECLARE
		kingdom_tool text;
		resident_tool text;
	BEGIN
		SELECT residents.id FROM residents WHERE residents.id=NEW.fk_resident_id INTO resident_tool;
	        SELECT kingdoms.id FROM kingdoms WHERE kingdoms.id=NEW.fk_kingdom_id INTO kingdom_tool;
		IF ( leader_tool IS NULL or  kingdom_tool IS NULL ) THEN
            		RAISE EXCEPTION '( resident: %; kingdom: % )', resident_tool, kingdom_tool;
        	END IF;

        	RETURN NEW;
	END;

$tools_check$ LANGUAGE plpgsql;


CREATE TRIGGER tools_check BEFORE INSERT OR UPDATE ON tools
	FOR EACH ROW EXECUTE PROCEDURE tools_check();
