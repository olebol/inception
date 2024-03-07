COMPOSE_PATH		:=	srcs/compose.yml

all: start

start: build
	docker compose -f $(COMPOSE_PATH) up -d

build:
	docker compose -f $(COMPOSE_PATH) build

stop:
	docker compose -f $(COMPOSE_PATH) down

ps:
	docker compose -f $(COMPOSE_PATH) ps

logs:
	docker compose -f $(COMPOSE_PATH) logs

.PHONY: all start build stop ps logs