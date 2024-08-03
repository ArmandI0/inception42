all:
	@docker compose up --build
down:
	@docker compose -f docker-compose.yml down
	@docker system prune -a -f
	@docker volume prune -f
	@docker network prune -f

delete:
	@docker volume rm srcs_wordpress
	@docker volume rm srcs_mariadb
stop:
	@docker compose -f docker-compose.yml stop