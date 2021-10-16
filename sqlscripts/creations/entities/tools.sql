CREATE TABLE IF NOT EXISTS tools (
    id serial PRIMARY KEY,
    name text not null,
    fk_kingdom_id serial NOT NULL,
    FOREIGN KEY( fk_kingdom_id ) REFERENCES kingdoms( id ),
    fk_resident_id serial NOT NULL,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id )
);
