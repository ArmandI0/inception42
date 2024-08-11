all:
	mkdir -p /home/aranger42/data
	mkdir -p /home/aranger42/data/mariadb
	mkdir -p /home/aranger42/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up --build

down:
	@docker compose -f ./srcs/docker-compose.yml down
	@docker system prune -a -f
	@docker volume prune -f
	@docker network prune -f

delete:
	@sudo rm -rf /home/aranger42/data/mariadb/*
	@sudo rm -rf /home/aranger42/data/wordpress/*

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

status:
	@echo "\nDOCKER STATUS:\n"
	# list all containers:
	docker ps
	@echo "\n"
	# list all the containers available locally:
	docker ps -a
	@echo "\n"
	# list images:
	docker images
	@echo "\n"
	# list all volumes:
	docker volume ls
	@echo "\n"
	# list all networks:
	docker network ls