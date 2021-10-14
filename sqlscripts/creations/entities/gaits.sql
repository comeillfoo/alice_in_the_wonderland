CREATE TABLE IF NOT EXISTS gaits (
    id serial PRIMARY KEY,
    name text NOT NULL,
    fk_resident_id integer,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id )
);