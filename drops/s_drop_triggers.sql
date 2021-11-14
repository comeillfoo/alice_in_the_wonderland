-- drop triggers
DROP TRIGGER IF EXISTS crowns_check on crowns CASCADE;

DROP TRIGGER IF EXISTS leader_role_check on leaders CASCADE;

DROP TRIGGER IF EXISTS leader_suit_check on leaders CASCADE;

DROP TRIGGER IF EXISTS resident_registration_check on residences CASCADE;

DROP TRIGGER IF EXISTS tool_owner_check on tools CASCADE;

DROP TRIGGER IF EXISTS weapon_owner_check on weapons CASCADE;

DROP TRIGGER IF EXISTS worships_check on worships CASCADE;

\i s_drop_functions_triggers.sql
