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

stop:
	$(DC) down

clean:
	rm -fR data
	rm -f dump*.sql

-include .env
