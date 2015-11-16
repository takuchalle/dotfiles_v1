DOTPATH    := $(PWD)
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .git .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all: deploy

help:
	@echo "make deploy"

deploy:
	@echo '==> Start to deploy dotfiles to home directory.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
