-- foreign keys indeces
DROP INDEX IF EXISTS clothes_fk_resident_id CASCADE;
DROP INDEX IF EXISTS residences_fk_resident_id CASCADE;
DROP INDEX IF EXISTS crowns_fk_clothes_id CASCADE;

DROP INDEX IF EXISTS tools_fk_resident_id CASCADE;
DROP INDEX IF EXISTS weapons_fk_resident_id CASCADE;
DROP INDEX IF EXISTS clothes_fk_type_name CASCADE;
DROP INDEX IF EXISTS registrations_fk_kingdom_id CASCADE;
DROP INDEX IF EXISTS tools_fk_kingdom_id CASCADE;
DROP INDEX IF EXISTS weapons_fk_kingdom_id CASCADE;

-- common indeces
DROP INDEX IF EXISTS registrations_expiry_date CASCADE;
DROP INDEX IF EXISTS leaders_kingdom_reign_enddate CASCADE;
DROP INDEX IF EXISTS patterns_description CASCADE;