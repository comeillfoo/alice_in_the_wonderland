CREATE TABLE IF NOT EXISTS residences (
    fk_resident_id integer,
    FOREIGN KEY( fk_resident_id ) REFERENCES residents( id ) ON DELETE CASCADE,
    fk_registration_id integer,
    FOREIGN KEY( fk_registration_id ) REFERENCES registrations( id ) ON DELETE CASCADE,
    PRIMARY KEY( fk_resident_id, fk_registration_id )
);