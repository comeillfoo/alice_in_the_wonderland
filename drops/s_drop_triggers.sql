-- drop triggers
DROP TRIGGER IF EXISTS clothes_check ON clothes CASCADE;

DROP TRIGGER IF EXISTS crowns_check ON crowns CASCADE;

DROP TRIGGER IF EXISTS leader_role_check ON leaders CASCADE;

DROP TRIGGER IF EXISTS leader_suit_check ON leaders CASCADE;

DROP TRIGGER IF EXISTS resident_registration_check ON residences CASCADE;

DROP TRIGGER IF EXISTS tool_owner_check ON tools CASCADE;

DROP TRIGGER IF EXISTS weapon_owner_check ON weapons CASCADE;

DROP TRIGGER IF EXISTS worships_check ON worships CASCADE;

DROP TRIGGER IF EXISTS regdates_check ON registrations CASCADE;

DROP TRIGGER IF EXISTS residents_count_update ON residences CASCADE;

\i s_drop_functions_triggers.sql
