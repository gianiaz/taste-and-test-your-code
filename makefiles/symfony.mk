help-symfony:
	@echo ""
	@echo "  ${boldunderline}SYMFONY COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}cache-clear-dev${normal} - Launch symfony cache clear on dev environment"
	@echo ""
	@echo "      ${bold}cache-clear-test${normal} - Launch symfony cache clear on test environment"
	@echo ""
	@echo "      ${bold}cache-warmup-dev${normal} - Launch symfony cache warmup on dev environment"
	@echo ""
	@echo "      ${bold}cache-warmup-test${normal} - Launch symfony cache warmup on test environment"

cache-clear-dev:
	@echo ""
	@echo "    ENV: DEV"
	@docker-compose exec -T fpm bin/console cache:clear --env=dev

cache-clear-test:
	@echo ""
	@echo "    ENV: TEST"
	@docker-compose exec -T fpm bin/console cache:clear --env=test

cache-warmup-dev:
	@echo ""
	@echo "    ENV: DEV"
	@docker-compose exec -T fpm bin/console cache:warmup --env=dev

cache-warmup-test:
	@echo ""
	@echo "    ENV: TEST"
	@docker-compose exec -T fpm bin/console cache:warmup --env=test
