CREATE OR REPLACE VIEW leaders_show_generations AS
    SELECT row_number() over() as id, kingdoms.fk_suit_name, leaders.kingdom_reign_enddate, residents.name, residents.fk_sex_name
        FROM leaders
            JOIN residents ON leaders.fk_resident_id = residents.id
            JOIN kingdoms ON leaders.fk_kingdom_id = kingdoms.id
            ORDER BY kingdoms.fk_suit_name, leaders.kingdom_reign_enddate DESC;

CREATE OR REPLACE VIEW leaders_count_courtiers AS
    SELECT row_number() over() as id, residents.name, count( worships.fk_courtier_id ) AS courtier
        FROM worships
            JOIN leaders ON leaders.id = worships.fk_leader_id
            JOIN residents ON leaders.fk_resident_id = residents.id
            GROUP BY residents.id, residents.name;

CREATE OR REPLACE VIEW kingdoms_count_tools AS
    SELECT row_number() over() as id, kingdoms.fk_suit_name AS kingdom, count( tools.id ) AS tools_number
        FROM tools
            JOIN kingdoms ON tools.fk_kingdom_id = kingdoms.id
            GROUP BY kingdoms.fk_suit_name;

CREATE OR REPLACE VIEW kingdoms_count_weapons AS
    SELECT row_number() over() as id, kingdoms.fk_suit_name AS kingdom, count( weapons.id ) AS weapons_number
        FROM weapons
            JOIN kingdoms ON weapons.fk_kingdom_id = kingdoms.id
            GROUP BY kingdoms.fk_suit_name;

CREATE OR REPLACE VIEW clothes_catalogue AS
    SELECT row_number() over() as id, clothes.id AS item, patterns.description AS pattern_name, clothes.density AS pattern_density, clothes.fk_colour_name AS colour, clothes.fk_type_name AS type 
        FROM clothes
            JOIN patterns ON clothes.fk_pattern_id = patterns.id
            WHERE clothes.fk_resident_id IS NULL;

CREATE OR REPLACE VIEW kingdoms_show_residents AS
    SELECT row_number() over() as id, residents.name AS name, residents.fk_sex_name AS sex, residents.fk_suit_name AS resident_suit, residents.fk_role_name AS role, kingdoms.fk_suit_name AS kingdom
        FROM residents
            JOIN residences ON residents.id = residences.fk_resident_id
            JOIN registrations ON residences.fk_registration_id = registrations.id
            JOIN kingdoms ON kingdoms.id = registrations.fk_kingdom_id 
            ORDER BY kingdoms.id;

CREATE OR REPLACE VIEW kingdoms_count_gardeners AS
    SELECT row_number() over() as id, kingdom, count( role ) AS gardeners
        FROM kingdoms_show_residents
        WHERE role = 'садовник'
        GROUP BY kingdom;

CREATE OR REPLACE VIEW kingdoms_count_soldiers AS
    SELECT row_number() over() as id, kingdom, count( role ) AS soldiers
        FROM kingdoms_show_residents
        WHERE role = 'солдат'
        GROUP BY kingdom;

CREATE OR REPLACE VIEW kingdoms_count_courtiers AS
    SELECT row_number() over() as id, kingdom, count( role ) AS courtiers
        FROM kingdoms_show_residents
        WHERE role = 'придворный'
        GROUP BY kingdom;

CREATE OR REPLACE VIEW kingdoms_count_males AS
    SELECT row_number() over() as id, kingdom, count( sex ) AS males
        FROM kingdoms_show_residents
        WHERE sex = 'мужчина'
        GROUP BY kingdom;

CREATE OR REPLACE VIEW kingdoms_count_females AS
    SELECT row_number() over() as id, kingdom, count( sex ) AS females
        FROM kingdoms_show_residents
        WHERE sex = 'женщина'
        GROUP BY kingdom;