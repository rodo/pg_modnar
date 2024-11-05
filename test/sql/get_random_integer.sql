--
--
--
BEGIN;

SELECT plan(4);

SELECT has_extension('pg_modnar');

SELECT has_function('get_random_integer');

SELECT function_returns('get_random_integer', ARRAY['integer', 'integer'], 'integer');

SELECT function_returns('get_random_integer', 'integer');

SELECT finish();

ROLLBACK;
