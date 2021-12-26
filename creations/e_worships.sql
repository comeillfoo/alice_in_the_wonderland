CREATE TABLE IF NOT EXISTS worships (
    fk_leader_id serial,
    FOREIGN KEY( fk_leader_id ) REFERENCES leaders( id ) ON DELETE CASCADE,
    fk_courtier_id serial,
    FOREIGN KEY( fk_courtier_id ) REFERENCES residents( id ) ON DELETE CASCADE,
    PRIMARY KEY( fk_leader_id, fk_courtier_id )
);
