CREATE TABLE IF NOT EXISTS kingdoms (
    id serial PRIMARY KEY,
    fk_suit_id serial,
    FOREIGN KEY( fk_suit_id ) REFERENCES suits( id ),
    number_of_residents integer NOT NULL
);