.PHONY : all build flush clean install test

FILES = $(shell find sql/ -type f)

TESTFILES = test/sql/get_random_country.sql

EXTENSION = pg_modnar

EXTVERSION = 0.0.3

DATA = $(wildcard pg_modnar--*.sql)

PGTLEOUT = pgtle.$(EXTENSION)-$(EXTVERSION).sql

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)

# edit this value if you want to deploy by hand
SCHEMA = @extschema@

include $(PGXS)

all: build

clean:
	rm -f pg_modnar--$(EXTVERSION).sql $(PGTLEOUT)

test:
	pg_prove $(TESTFILES)

pgtle: build
	sed -e 's/_EXTVERSION_/$(EXTVERSION)/' pgtle_header.in > $(PGTLEOUT)
	cat pg_modnar--$(EXTVERSION).sql >>  $(PGTLEOUT)
	cat pgtle_footer.in >> $(PGTLEOUT)

build: $(FILES)
	cat $(FILES) > pg_modnar--$(EXTVERSION).sql

install: build
