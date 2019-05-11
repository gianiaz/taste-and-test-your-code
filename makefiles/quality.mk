help-quality:
	@echo ""
	@echo "  ${boldunderline}QUALITY COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}phpstan${normal} - Runs PHP Static Analysis Tool"
	@echo ""
	@echo "      ${bold}code-style-check${normal} - Checks code style with php-cs-fixer"
	@echo ""
	@echo "      ${bold}code-style-fix${normal} - Fixes code style using php-cs-fixer"
	@echo ""

phpstan:
	@echo "PHP STAN"
	@echo ""
	@docker-compose exec -T fpm ./vendor/bin/phpstan analyse

code-style-check:
	@echo "CODE STYLE  CHECK"
	@echo ""
	@docker-compose exec -T fpm ./vendor/bin/php-cs-fixer fix --verbose --ansi --dry-run

code-style-fix:
	@echo "CODE STYLE FIX"
	@echo ""
	@docker-compose exec -T fpm ./vendor/bin/php-cs-fixer fix --verbose --ansi
