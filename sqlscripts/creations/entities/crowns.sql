CREATE TABLE IF NOT EXISTS crowns (
    id serial PRIMARY KEY,
    value integer NOT NULL,
    fk_clothes_id serial NOT NULL UNIQUE,
    FOREIGN KEY( fk_clothes_id ) REFERENCES clothes( id )
);