COMPOSE_PATH		:=	srcs/compose.yml

all: start

start: build
	docker compose -f $(COMPOSE_PATH) up -d

build:
	docker compose -f $(COMPOSE_PATH) build

stop:
	docker compose down

ps:
	docker compose ps

logs:
	docker compose logs

.PHONY: all start build stop ps logs