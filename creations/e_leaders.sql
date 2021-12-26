CREATE TABLE IF NOT EXISTS leaders (
    id serial PRIMARY KEY,
    fk_kingdom_id serial,
    FOREIGN KEY( fk_kingdom_id ) REFERENCES kingdoms( id ),
    kingdom_reign_enddate date,
    fk_resident_id serial UNIQUE,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id ) ON DELETE CASCADE,
    fk_crown_id integer, -- may be NULL
    FOREIGN KEY( fk_crown_id ) REFERENCES crowns( id )
);
