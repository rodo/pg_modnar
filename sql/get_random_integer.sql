-- Get a random integer
--
--
--
CREATE OR REPLACE FUNCTION get_random_integer() RETURNS INTEGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN CAST(random() * 100 AS INTEGER);
END;
$$;
