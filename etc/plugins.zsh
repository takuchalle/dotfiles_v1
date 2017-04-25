#
# Copyright (c) 2015,2016 Takuya OHASHI. All rights reserved.
#
if [ -e $ZPLUG_HOME/init.zsh ];then
    source $ZPLUG_HOME/init.zsh
    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-completions"
    zplug "b4b4r07/enhancd", use:init.sh
    zplug "k4rthik/git-cal", as:command, frozen:1
    zplug "stedolan/jq", \
	  from:gh-r, \
	  as:command, \
	  rename-to:jq, if:"[! [ $OSTYPE == *CYGWIN* ]]"
    zplug "b4b4r07/emoji-cli", \
	      on:"stedolan/jq", if:"[! [ $OSTYPE == *CYGWIN* ]]"
    zplug "mrowa44/emojify", as:command
    zplug "junegunn/fzf-bin", \
	  from:gh-r, \
	  as:command, \
	  rename-to:fzf, \
	  use:"*linux*amd64*", if:"[[ $OSTYPE == *linux* ]]"
    zplug "junegunn/fzf-bin", \
	  from:gh-r, \
	  as:command, \
	  rename-to:fzf, \
	  use:"*darwin*amd64*", if:"[[ $OSTYPE == *darwin* ]]"

    zplug "jhawthorn/fzy", \
	  as:command, \
	  hook-build:'make'
    
    zplug "b4b4r07/git-br", \
	  as:command, \
	  use:'git-br'
    
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
