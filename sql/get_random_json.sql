-- Get a random json
--
--
CREATE OR REPLACE FUNCTION get_random_json() RETURNS json
    LANGUAGE plpgsql
    AS $$
BEGIN

    RETURN json_build_object(get_random_text(),
                             get_random_text(),
                             get_random_text(),
                             get_random_integer() );
END;
$$;
