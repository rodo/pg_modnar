# pg_modnar
Set of functions to generate random values in PostgreSQL

## Install

To install the extension, start by defining your connections
parameters in your shell as usual.

If your connection string is well set up, the install is easy as

```
$ make install
```

## Install with pg_tle

If you work with AWS RDS you can deploy the extension with
[pg_tle](https://github.com/aws/pg_tle), to build the file to deploy
it just do :

```
$ make pgtle
```

And execute the file `pgtle.pg_modnar-0.0.1.sql` on your instance

## Functions

```
get_random_date()
get_random_text()
get_random_text(string_length INTEGER, possible_chars TEXT)
get_random_integer()
get_random_json()
```