all:
	@docker compose up --build
down:
	@docker compose -f docker-compose.yml down
	@docker system prune -a -f
	@docker volume prune -f
	@docker network prune -f
stop:
	@docker compose -f docker-compose.yml stop