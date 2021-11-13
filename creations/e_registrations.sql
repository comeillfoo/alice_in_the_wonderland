CREATE TABLE IF NOT EXISTS registrations (
    id serial PRIMARY KEY,
    fk_kingdom_id serial,
    FOREIGN KEY( fk_kingdom_id ) REFERENCES kingdoms( id ),
    issue_date timestamp NOT NULL,
    expiry_date timestamp
);