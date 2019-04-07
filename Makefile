.: quickstart
	@echo "... happy coding"
	@echo ""

quickstart: header
	@echo "    Usage:"
	@echo ""
	@echo "      ${bold}make COMMAND${normal}"
	@echo ""
	@echo "    Start the full environment with:"
	@echo ""
	@echo "      ${bold}make start${normal}"
	@echo ""
	@echo "    Get an interactive shell (inside the PHP container) with:"
	@echo ""
	@echo "      ${bold}make shell${normal}"
	@echo ""
	@echo "    To get help and the full list of commands:"
	@echo ""
	@echo "      ${bold}make help${normal}"
	@echo ""
	@echo ""

help: quickstart
	@make help-composer
	@make help-docker
	@make help-encore
	@make help-symfony
	@make help-test
	@make help-utils
	@echo ""

start:
	running=$$(docker-compose ps fpm | grep -c "Up"); \
	if [ "$$running" -eq 0 ]; then \
		docker-compose up -d nginx; \
	fi;

shell: start
	@docker-compose exec fpm zsh

setup: start composer-install db-setup

include makefiles/composer.mk
include makefiles/docker.mk
include makefiles/encore.mk
include makefiles/symfony.mk
include makefiles/test.mk
include makefiles/utils.mk

### UTILS

header:

	@echo ""
	@echo "${bold}"
	@echo "     ______           __                          __   __            __ "
	@echo "    /_  __/___ ______/ /____     ____ _____  ____/ /  / /____  _____/ /_"
	@echo "     / / / __ \`/ ___/ __/ _ \   / __ \`/ __ \/ __  /  / __/ _ \/ ___/ __/"
	@echo "    / / / /_/ (__  ) /_/  __/  / /_/ / / / / /_/ /  / /_/  __(__  ) /_  "
	@echo "   /_/  \__,_/____/\__/\___/   \__,_/_/ /_/\__,_/   \__/\___/____/\__/"
	@echo ""
	@echo "                                                __"
	@echo "      __  ______  __  _______   _________  ____/ /__"
	@echo "     / / / / __ \/ / / / ___/  / ___/ __ \/ __  / _ \\"
	@echo "    / /_/ / /_/ / /_/ / /     / /__/ /_/ / /_/ /  __/"
	@echo "    \__, /\\____/\\__,_/_/      \\___/\\____/\\__,_/\\___/"
	@echo "   /____/"
	@echo ""
	@echo ""

bold := "\\033[1m"
normal := "\\033[0m"
boldunderline := "\\033[1m\\033[4m"

.SILENT:
