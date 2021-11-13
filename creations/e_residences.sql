CREATE TABLE IF NOT EXISTS residences (
    fk_resident_id integer,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id ),
    fk_registration_id integer,
    FOREIGN KEY( fk_registration_id ) REFERENCES registrations( id ),
    PRIMARY KEY( fk_resident_id, fk_registration_id )
);