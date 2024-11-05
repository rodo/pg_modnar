--
--
--
BEGIN;

SELECT plan(2);

SELECT has_schema('pg_modnar'::name);

SELECT has_function('get_random_country');

SELECT finish()

ROLLBACK;
