help-composer:
	@echo ""
	@echo "  ${boldunderline}COMPOSER COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}composer-install${normal} - Launch composer install"
	@echo ""
	@echo "      ${bold}composer-update${normal} - Launch composer update"
	@echo ""

composer-install:
	@docker-compose exec -T fpm composer install --ansi

composer-update:
	@docker-compose exec -T fpm composer update --ansi
