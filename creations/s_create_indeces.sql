-- foreign keys indeces
CREATE INDEX clothes_fk_resident_id ON clothes ( fk_resident_id );
CREATE INDEX residences_fk_resident_id ON residences ( fk_resident_id );
CREATE INDEX crowns_fk_clothes_id ON crowns ( fk_clothes_id );

CREATE INDEX tools_fk_resident_id ON tools ( fk_resident_id );
CREATE INDEX weapons_fk_resident_id ON weapons ( fk_resident_id );
CREATE INDEX clothes_fk_type_name ON clothes ( fk_type_name );
CREATE INDEX registrations_fk_kingdom_id ON registrations ( fk_kingdom_id );
CREATE INDEX tools_fk_kingdom_id ON tools ( fk_kingdom_id );
CREATE INDEX weapons_fk_kingdom_id ON weapons ( fk_kingdom_id );

-- common indeces
CREATE INDEX registrations_expiry_date ON registrations ( expiry_date );
CREATE INDEX leaders_kingdom_reign_enddate ON leaders ( kingdom_reign_enddate );
CREATE INDEX patterns_description ON patterns USING gin( description );