all:
	@cd srcs && docker-compose up -d

fclean:
	@cd srcs && docker-compose down
