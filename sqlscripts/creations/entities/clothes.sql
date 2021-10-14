CREATE TABLE IF NOT EXISTS clothes (
    id serial PRIMARY KEY,
    fk_resident_id integer,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id ),
    fk_pattern_id serial NOT NULL,
    FOREIGN KEY( fk_pattern_id ) REFERENCES patterns( id ),
    fk_colour_id serial NOT NULL,
    FOREIGN KEY( fk_colour_id ) REFERENCES colours( id ),
    density integer NOT NULL,
    fk_type_id serial NOT NULL,
    FOREIGN KEY( fk_type_id ) REFERENCES types( id ) 
);