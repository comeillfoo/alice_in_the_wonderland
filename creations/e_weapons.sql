CREATE TABLE IF NOT EXISTS weapons (
    id serial PRIMARY KEY,
    name text NOT NULL,
    fk_kingdom_id serial NOT NULL,
    FOREIGN KEY( fk_kingdom_id ) REFERENCES kingdoms( id ),
    fk_resident_id serial NOT NULL,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id ) ON DELETE CASCADE
);