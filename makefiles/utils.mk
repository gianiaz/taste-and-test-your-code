help-utils:
	@echo ""
	@echo "  ${boldunderline}UTILS COMMANDS${normal}  "
	@echo ""
	@echo "      ${bold}xdebug-ip${normal} - Updates remote host ip address in docker-compose.override"
	@echo "                  and restart PHP container"
	@echo ""
	@echo "      ${bold}pre-commit-check${normal} - Runs code-style-fix, phpstan, tests"
	@echo ""
	@echo "      ${bold}merge-develop${normal} - Merge develop into current branch"
	@echo ""

xdebug-ip:
	$(eval ADDRESS=$(shell docker-compose exec fpm ip route show 0.0.0.0/0 | grep -Eo 'via \S+' | sed -e 's/via //' || echo "NOT RECOGNIZED"))
	$(eval SED_SUBSTITUTION:="s/(remote_host=)([0-9]{1,3}.){3}[0-9]{1,3}/\\1$(ADDRESS)/")
	sed -ri $(SED_SUBSTITUTION) docker-compose.override.yml
	echo Changed ip address for debug into $(ADDRESS), please check your docker-compose.override.yml
	echo ""
	@make restart

diff-helm-template: helm-template
	@docker-compose exec -T fpm /bin/sh -c "git diff --exit-code"

pre-commit-check: code-style-fix \
                  phpstan \
                  test \
                  test-mapping-doctrine

merge-develop:
	$(call merge)

define merge
	$(eval UNTRACKED=$(shell git diff-index --quiet HEAD -- || echo "untracked"))
    if [ $(UNTRACKED) ]; then \
		echo "Please commit your files before merging"; \
    else \
		git fetch; \
		git merge origin/develop; \
    fi
endef
