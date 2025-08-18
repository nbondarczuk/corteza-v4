DC := docker compose
TS := $(shell date "+%Y%m%d%H%M%S")
BACKEND_DDL_FILE ?= sql/backend-ddl-tables.sql

up:
	$(DC) up -d -V

ps:
	$(DC) ps

version:
	curl  http://localhost:18080/version

health:
	curl  http://localhost:18080/healthcheck

dump:
	$(DC) exec db pg_dump $(OMIT_TABLES) -d $(POSTGRES_DB) -c -U $(POSTGRES_USER) > dump-$(TS).sql

restore:
	cat dump.sql | $(DC) exec db psql -U $(POSTGRES_USER)

exec-db:
	$(DC) exec -it db psql -U $(POSTGRES_USER) -p $(POSTGRES_PORT)

exec-server:
	$(DC) exec -it server bash

exec-corredor:
	$(DC) exec -it corredor bash

init-db:
	$(DC) cp ${BACKEND_DDL_FILE} db:/
	$(DC) exec -it db psql -U $(POSTGRES_USER) -c "CREATE DATABASE backend;"
	$(DC) exec -it db psql -U $(POSTGRES_USER) -d backend -f /${BACKEND_DDL_FILE}

down:
	$(DC) down

clean:
	rm -fR data
	rm -f dump*.sql

-include .env
