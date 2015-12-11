#
# Copyright (c) 2015, TAKUYA Ohashi. All rights reserved.
#
DOTPATH    := $(PWD)
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
EMACSDPATH := $(DOTPATH)/.emacs.d

.PHONY: deploy setup help update

all: update setup deploy install

help:
	@echo "make deploy"

setup: 
	@echo '==> Start Emacs setup'
	@-cd $(EMACSDPATH) && cask install
	-emacsclient -e '(kill-emacs)' 2> /dev/null
	emacs --daemon > /dev/null 2> /dev/null

deploy: 
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

install:
	@exec $$SHELL

update:
	git pull
