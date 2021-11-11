DROP FUNCTION IF EXISTS insert_clothes( integer, integer, text, integer, text ) CASCADE;

DROP FUNCTION IF EXISTS insert_colour( text ) CASCADE;

DROP FUNCTION IF EXISTS insert_crowns( integer, integer ) CASCADE;

DROP FUNCTION IF EXISTS insert_gaits( text, integer ) CASCADE;

DROP FUNCTION IF EXISTS insert_kingdoms( varchar(16), integer ) CASCADE;

DROP FUNCTION IF EXISTS coronate( serial ) CASCADE;