-- Get a random date
--
--
CREATE OR REPLACE FUNCTION get_random_date(
       inter INTERVAL DEFAULT '20 year'::interval,
       period TEXT DEFAULT 'random'
       ) returns date as
$$
DECLARE
  result date;
BEGIN
    IF period = 'past' THEN
        result := now() - (random() * inter);
    ELSIF period = 'future' THEN
        result := now() + (random() * inter);
    ELSE
        result := now() + ((random() - 0.5) * 2 * inter);
    END IF;

    return result;
END;
$$ language plpgsql;
