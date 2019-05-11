help-encore:
	@echo ""
	@echo "  ${boldunderline}ENCORE COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}encore-build${normal} - Build assets with yarn/encore"
	@echo ""
	@echo "      ${bold}encore-build-watch${normal} - Build assets with yarn/encore with watch flag"
	@echo ""
	@echo "      ${bold}encore-build-prod${normal} - Build assets with yarn/encore for production"
	@echo ""
	@echo "      ${bold}encore-shell${normal} - Access to yarn container shell"
	@echo ""

encore-build:
	@docker-compose run --rm yarn /bin/sh -c "yarn && yarn run encore dev --progress"

encore-build-watch:
	@docker-compose run --rm yarn /bin/sh -c "yarn install && yarn run encore dev --watch --progress"

encore-build-prod:
	@docker-compose run --rm yarn /bin/sh -c "yarn && yarn run encore production"

encore-shell:
	@docker-compose run --rm yarn /bin/sh
