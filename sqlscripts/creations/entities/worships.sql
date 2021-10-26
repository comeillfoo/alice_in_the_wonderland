CREATE TABLE IF NOT EXISTS worships (
    fk_leader_id serial,
    FOREIGN KEY( fk_leader_id ) REFERENCES leaders( id ),
    fk_courtier_id serial,
    FOREIGN KEY( fk_courtier_id ) REFERENCES residents( id ),
<<<<<<< HEAD
    PRIMARY KEY( fk_leader_id, fk_courtier_id )
);
=======
    PRIMARY KEY( fk_leader_id, fk_resident_id )
);
>>>>>>> 2ae5f5d2fbb5d04e0f74be5df4942ec63f2e8aea
