CREATE TABLE IF NOT EXISTS worships (
    fk_leader_id serial,
    FOREIGN KEY( fk_leader_id ) REFERENCES leaders( id ),
    fk_courtier_id serial,
    FOREIGN KEY( fk_courtier_id ) REFERENCES residents( id ),
    PRIMARY KEY( fk_leader_id, fk_courtier_id )
);
