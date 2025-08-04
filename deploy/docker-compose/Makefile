DC := docker-compose
# OMIT_TABLES := -T corteza.actionlog -T corteza.automation_sessions -T corteza.resource_activity_log
TS := $(shell date "+%Y%m%d%H%M%S")

start:
	$(DC) up -d

show:
	$(DC) ps

version:
	curl  http://localhost:18080/version

healthcheck:
	curl  http://localhost:18080/healthcheck

dump:
	$(DC) exec db pg_dump $(OMIT_TABLES) -d $(POSTGRES_DB) -c -U $(POSTGRES_USER) > dump-$(TS).sql

restore:
	cat dump.sql | $(DC) exec db psql -U $(POSTGRES_USER)

exec-db:
	$(DC) exec -it db psql -U $(POSTGRES_USER)

exec-server:
	$(DC) exec -it server bash

exec-corredor:
	$(DC) exec -it corredor bash

init-db:
	$(DC) cp sql/v4final-backend-ddl-tables.sql db:/
	$(DC) exec -it db psql -U $(POSTGRES_USER) -c "CREATE DATABASE backend;"
	$(DC) exec -it db psql -U $(POSTGRES_USER) -d backend -f /backend-ddl-tables.sql

stop:
	$(DC) down

clean:
	rm -fR data
	rm -f dump*.sql

-include .env
