CREATE TABLE IF NOT EXISTS registrations (
    id serial PRIMARY KEY,
    fk_kingdom_id serial,
    FOREIGN KEY( fk_kingdom_id ) REFERENCES kingdoms( id ),
    issue_date date NOT NULL,
    expiry_date date
);