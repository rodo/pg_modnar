-- Get a random float
--
--
--
CREATE OR REPLACE FUNCTION get_random_float() RETURNS FLOAT
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN CAST(random() * 100 AS FLOAT);
END;
$$;
