.PHONY : all build flush clean install test

FILES = $(shell find sql/ -type f)

TESTFILES = test/sql/get_random_country.sql

EXTENSION = pg_modnar

EXTVERSION = 0.0.2

DATA = pg_modnar--$(EXTVERSION).sql pg_modnar--0.0.1--0.0.2.sql

PGTLEOUT = pgtle.$(EXTENSION)-$(EXTVERSION).sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

# edit this value if you want to deploy by hand
SCHEMA = @extschema@

include $(PGXS)

all: build

test:
	pg_prove $(TESTFILES)

pgtle: build
	sed -e 's/_EXTVERSION_/$(EXTVERSION)/' pgtle_header.in > $(PGTLEOUT)
	cat pg_modnar--$(EXTVERSION).sql >>  $(PGTLEOUT)
	cat pgtle_footer.in >> $(PGTLEOUT)

build: $(FILES)
	cat $(FILES) > $(DATA)

install: build
