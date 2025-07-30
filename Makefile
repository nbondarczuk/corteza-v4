DC := docker-compose

start:
	$(DC) up -d

show:
	$(DC) ps

stop:
	$(DC) down

clean:
	rm -fR data
