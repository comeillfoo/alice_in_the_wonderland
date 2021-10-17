CREATE TABLE IF NOT EXISTS kingdoms (
    id serial PRIMARY KEY,
    fk_suit_name varchar(16),
    FOREIGN KEY( fk_suit_name ) REFERENCES suits( name ),
    number_of_residents integer NOT NULL
);