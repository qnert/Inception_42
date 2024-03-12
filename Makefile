all:
	@cd srcs && docker-compose up

fclean:
	@cd srcs && docker-compose down
