CREATE OR REPLACE FUNCTION residents_count_update(
) RETURNS trigger AS
$residents_count_update$
    DECLARE
        kingdom_id integer := ( SELECT fk_kingdom_id FROM registrations WHERE id = NEW.fk_registration_id );
        current_number integer := ( SELECT COUNT(*) FROM residences WHERE fk_registration_id IN ( SELECT id FROM registrations WHERE fk_kingdom_id = kingdom_id ) ); 
    BEGIN
        UPDATE kingdoms SET number_of_residents = current_number WHERE id = kingdom_id;

        RETURN NEW;
    END;
$residents_count_update$
LANGUAGE plpgsql;

CREATE TRIGGER residents_count_update AFTER INSERT OR UPDATE ON residences
    FOR EACH ROW EXECUTE PROCEDURE residents_count_update();
