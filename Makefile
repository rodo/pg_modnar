.PHONY : all build flush clean install test

FILES = $(shell find sql/ -type f)

TESTFILES = test/sql/get_random_country.sql

EXTENSION = pg_modnar

EXTVERSION = 0.0.1

DATA = pg_modnar--$(EXTVERSION).sql

PGTLEOUT = pgtle.$(EXTENSION)-$(EXTVERSION).sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

# edit this value if you want to deploy by hand
SCHEMA = @extschema@

include $(PGXS)

all: $(FILES) $(TESTFILES)

clean:
	rm -f $(DATA) $(PGTLEOUT)

test:
	pg_prove $(TESTFILES)

flush:
	psql -f clean/drop_event_trigger.sql
	psql -f clean/drop_function.sql
	psql -f clean/drop_table.sql
	psql -f table.sql
	psql -f function.sql
	psql -f event_trigger.sql

pgtle: build
	sed -e 's/_EXTVERSION_/$(EXTVERSION)/' pgtle_header.in > $(PGTLEOUT)
	cat $(DATA) >>  $(PGTLEOUT)
	cat pgtle_footer.in >> $(PGTLEOUT)


build: $(FILES)
	echo "#" > $(DATA)
	cat $(FILES) > $(DATA)

install: build
