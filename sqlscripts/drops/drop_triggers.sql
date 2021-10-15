-- drop triggers
DROP TRIGGER IF EXISTS leader_suit_check CASCADE;

DROP TRIGGER IF EXISTS resident_registration_check CASCADE;

DROP TRIGGER IF EXISTS tools_check CASCADE;

DROP TRIGGER IF EXISTS weapons_check CASCADE;

DROP TRIGGER IF EXISTS worships_check CASCADE;


\i drop_functions_triggers.sql