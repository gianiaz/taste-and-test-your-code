help-docker:
	@echo ""
	@echo "  ${boldunderline}DOCKER COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}restart${normal} - restart php container "
	@echo ""
	@echo "      ${bold}docker-build-php${normal} - Build and tag the PHP Docker image"
	@echo ""

restart:
	@docker-compose stop fpm
	@docker-compose up -d fpm

docker-build-php:
	@docker build -t gianiaz/test-code . -f docker/fpm/Dockerfile

docker-build-nginx:
	@docker build -t gianiaz/test-code-nginx . -f docker/nginx/Dockerfile

docker-down:
	@docker-compose down

stop:
	@docker-compose stop
