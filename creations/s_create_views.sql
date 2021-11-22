CREATE OR REPLACE VIEW leaders_show_generations AS SELECT leaders.kingdom_reign_enddate, kingdoms.fk_suit_name, residents.name, residents.fk_sex_name FROM leaders JOIN residents ON leaders.fk_resident_id = residents.id JOIN kingdoms ON leaders.fk_kingdom_id = kingdoms.id GROUP BY leaders.kingdom_reign_enddate, kingdoms.fk_suit_name, residents.name, residents.fk_sex_name ORDER BY leaders.kingdom_reign_enddate, kingdoms.fk_suit_name;