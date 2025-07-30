DC := docker-compose

start:
	$(DC) up -d

show:
	$(DC) ps

version:
	curl  http://localhost:18080/version

healthcheck:
	curl  http://localhost:18080/healthcheck

stop:
	$(DC) down

clean:
	rm -fR data
