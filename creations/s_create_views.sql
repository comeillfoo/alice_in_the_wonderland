CREATE OR REPLACE VIEW leaders_show_generations AS
    SELECT kingdoms.fk_suit_name, leaders.kingdom_reign_enddate, residents.name, residents.fk_sex_name
        FROM leaders
            JOIN residents ON leaders.fk_resident_id = residents.id
            JOIN kingdoms ON leaders.fk_kingdom_id = kingdoms.id
            ORDER BY kingdoms.fk_suit_name, leaders.kingdom_reign_enddate DESC;

CREATE OR REPLACE VIEW kingdoms_count_tools AS
    SELECT tools.fk_kingdom_id, kingdoms.fk_suit_name, count( tools.id ) AS tools_number
        FROM tools
            JOIN kingdoms ON tools.fk_kingdom_id = kingdoms.id
            GROUP BY fk_kingdom_id;