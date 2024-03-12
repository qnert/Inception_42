all:
	@cd srcs && docker-compose build

up:
	@cd srcs && docker-compose up

fclean:
	@cd srcs && docker-compose down --rmi all

except:
	@docker system prune --all --force --volumes
