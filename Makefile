build:
	mkdir -p /home/odakhch/Desktop/data
	mkdir -p /home/odakhch/Desktop/data/my_mariadb
	mkdir -p /home/odakhch/Desktop/data/my_wordpress
	docker compose -f ./srcs/docker-compose.yml up --build
run:
	docker compose -f ./srcs/docker-compose.yml up
down:
	docker compose -f ./srcs/docker-compose.yml down
clean: down
	docker volume rm $$(docker volume ls -q);\
	rm -rf /home/odakhch/Desktop/data;
fclean: down
	docker system prune -a -f;\
	docker volume rm $$(docker volume ls -q);\
	rm -rf /home/odakhch/Desktop/data;\

.PHONY: build run stop clean fclean