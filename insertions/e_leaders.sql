INSERT INTO leaders ( id, fk_kingdom_id, kingdom_reign_enddate, fk_resident_id, fk_crown_id )
    VALUES
        ( DEFAULT, 1, current_date,  0, NULL ),
        ( DEFAULT, 1, current_date,  1, NULL ),
        ( DEFAULT, 1,         NULL,  2,    0 ),

        ( DEFAULT, 0,         NULL,  3,    1 ),
        ( DEFAULT, 3,         NULL,  4,    2 ),
        ( DEFAULT, 2, current_date, 10, NULL ),

        ( DEFAULT, 2,         NULL, 11,    3 ),
        ( DEFAULT, 0,         NULL, 14,    4 );
        