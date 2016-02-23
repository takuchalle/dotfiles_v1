#
# Copyright (c) 2015, TAKUYA Ohashi. All rights reserved.
#
if [ -e $HOME/.zplug/zplug ];then
    source ~/.zplug/zplug
    zplug "zsh-users/zsh-syntax-highlighting", nice:10
    zplug "zsh-users/zsh-history-substring-search"
    zplug "b4b4r07/enhancd", at:v1
    zplug "k4rthik/git-cal", as:command, frozen:1
    zplug "b4b4r07/emoji-cli"
    zplug "mrowa44/emojify", as:command

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
	    echo; zplug install
	fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load --verbose
fi
