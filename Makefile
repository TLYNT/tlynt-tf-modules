_ENV?=dev
_PREFIX?=tlynt

fmt-check:
	terraform fmt -recursive -check

fmt:
	terraform fmt -recursive

install-terra-env:
	@chmod 755 scripts/install_terra_env
	./scripts/install_terra_env

ci-install-terra-env:
	@chmod 755 scripts/ci_install_terra_env
	./scripts/ci_install_terra_env

set-terra-versions:
	@chmod 755 ~/.tfenv/bin/terraform
	@chmod 755 ~/.tgenv/bin/terragrunt
	@tfenv install
	@tgenv install
	@tfenv use $(shell cat .terraform-version)
	@tgenv use $(shell cat .terragrunt-version)

generate-changelog:
	@chmod 755 scripts/generate_changelog
	@./scripts/generate_changelog

install-git-hooks:
	@chmod 755 scripts/install_git_hooks
	./scripts/install_git_hooks

