start:
	# @mkdir -p /home/ziggy/data/database
	# @mkdir -p /home/ziggy/data/web
	docker compose -f ./srcs/docker-compose.yml up -d --build
stop:
	docker compose -f ./srcs/docker-compose.yml down
prune:
	docker system prune --all --volumes
delete_volumes:
	@make stop
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume ls -q | xargs docker volume rm; \
	else \
		echo "No volumes to delete."; \
	fi
	@sudo rm -rf /home/ziggy/data/database
	@sudo rm -rf /home/ziggy/data/web
fclean:
	make delete_volumes
	docker rmi -f $$(docker images -qa); \
	docker rm -vf $$(docker ps -aq); \
	make prune
eval:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q) 2>/dev/null

re:
	make fclean
	make start