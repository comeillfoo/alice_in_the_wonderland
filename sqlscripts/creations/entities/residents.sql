CREATE TABLE IF NOT EXISTS residents (
    id serial PRIMARY KEY,
    name text not null,
    fk_suit_id integer,
    FOREIGN KEY( fk_suit_id ) REFERENCES suits( id ),
    fk_sex_id integer,
    FOREIGN KEY( fk_sex_id ) REFERENCES sexes( id ),
    fk_role_id integer,
    FOREIGN KEY( fk_role_id ) REFERENCES roles( id )
);
