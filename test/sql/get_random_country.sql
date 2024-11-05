--
--
--
BEGIN;

SELECT plan(3);

SELECT has_extension('pg_modnar');

SELECT has_function('get_random_country');

SELECT function_returns('get_random_country', 'text');

SELECT finish();

ROLLBACK;
