if [ -e $HOME/.zplug/zplug ];then
    source ~/.zplug/zplug
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "b4b4r07/enhancd", at:v1
    zplug "olivierverdier/zsh-git-prompt"
    zplug "k4rthik/git-cal", as:command, frozen:1

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
