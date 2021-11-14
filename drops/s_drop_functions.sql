-- bussiness processes
DROP FUNCTION IF EXISTS coronate( integer ) CASCADE;

DROP FUNCTION IF EXISTS cloth_buy( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS cloth_sell( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS tool_move( integer, integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS weapon_move( integer, integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS resident_move( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS visit_kingdom( integer, integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS expired_registrations_delete( ) CASCADE;