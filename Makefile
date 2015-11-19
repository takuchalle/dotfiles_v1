DOTPATH    := $(PWD)
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
EMACSDPATH := $(DOTPATH)/.emacs.d

.PHONY: deploy setup help update

all: deploy

help:
	@echo "make deploy"

setup: update
	@echo '==> Start Emacs setup'
	cd $(EMACSDPATH); cask install

deploy: setup
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

update:
	git pull
