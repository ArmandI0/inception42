all:
	@docker compose up --build
down:
	@docker compose -f docker-compose.yml down
	@docker system prune -a -f
	@docker volume prune -f
	@docker network prune -f

delete:
	@sudo rm -rf /home/aranger42/data/mariadb/*
	@sudo rm -rf /home/aranger42/data/wordpress/*
stop:
	@docker compose -f docker-compose.yml stop