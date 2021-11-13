DROP FUNCTION IF EXISTS insert_clothes( integer, integer, text, integer, text ) CASCADE;

DROP FUNCTION IF EXISTS insert_colour( text ) CASCADE;

DROP FUNCTION IF EXISTS insert_crowns( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS insert_gaits( text, integer ) CASCADE;

DROP FUNCTION IF EXISTS insert_kingdoms( varchar(16), integer ) CASCADE;

DROP FUNCTION IF EXISTS coronate( integer ) CASCADE;

DROP FUNCTION IF EXISTS cloth_buy( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS cloth_sell( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS tool_move( integer, integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS weapon_move( integer, integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS resident_move( integer, integer ) CASCADE;