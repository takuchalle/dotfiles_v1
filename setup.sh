#!/bin/zsh


ZPLUG_DIR="~/.zplug/"
if [ -e $ZPLUG_DIR ]; then
	echo "Install zplug"
  	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
else
	echo "zplug is already installed"
fi

