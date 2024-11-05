
-- get a random ipv4 random address
--
-- very simple version, some address may be invalid
--
CREATE OR REPLACE FUNCTION get_random_inet(
       fourth int DEFAULT 250,
       three int DEFAULT 250,
       two int DEFAULT 250,
       one int DEFAULT 250       
    ) RETURNS inet
    LANGUAGE plpgsql
    AS $$
BEGIN
    return CONCAT(
      TRUNC(RANDOM() * fourth + 2), '.',
      TRUNC(RANDOM() * three + 2), '.',
      TRUNC(RANDOM() * two + 2), '.',
      TRUNC(RANDOM() * one + 2)
)::inet;

END;
$$;
