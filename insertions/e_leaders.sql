INSERT INTO leaders ( id, fk_kingdom_id, kingdom_reign_enddate, fk_resident_id, fk_crown_id )
    VALUES
        ( DEFAULT, 1, current_date,  4, NULL ),
	( DEFAULT, 1, current_date,  15, NULL ),
        ( DEFAULT, 2,         NULL,  1,    NULL ),

        ( DEFAULT, 4,         NULL,  5,    1 ),
        ( DEFAULT, 2,         NULL,  2,    2 ),
        ( DEFAULT, 2, current_date,  3, NULL ),

        ( DEFAULT, 3,         NULL, 11,    3 );
