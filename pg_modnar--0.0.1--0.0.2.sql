CREATE OR REPLACE FUNCTION get_random_integer() RETURNS INTEGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN CAST(random() * 100 AS INTEGER);
END;
$$;

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

CREATE OR REPLACE FUNCTION get_random_text(
        IN string_length INTEGER,
        IN possible_chars TEXT
        DEFAULT '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
    ) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    i INT4;
    pos INT4;
BEGIN
    RETURN get_random_string(string_length, possible_chars);
END;
$$;


CREATE OR REPLACE FUNCTION get_random_text() RETURNS text
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN get_random_string(CAST(random()*32 AS INTEGER));
END;
$$;
