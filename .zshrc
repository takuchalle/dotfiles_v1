#
# Shell Variables
#
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zhistory
#SHELL=/bin/zsh

setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

#
# Color Settings
#
autoload -U colors;
colors

#
# Git
#
_set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch &> /dev/null | grep '^\*' | cut -b 3- )
}

_update_rprompt () {
  if [ "`git ls-files 2>/dev/null`" ]; then
    RPROMPT="($GIT_CURRENT_BRANCH) [%h](%T)"
  else
    RPROMPT="[%h](%T)"
  fi
} 
  
precmd() 
{ 
  _set_env_git_current_branch
  _update_rprompt
}

chpwd()
{
  _set_env_git_current_branch
  _update_rprompt
}

#
# Prompt
#
PROMPT="%{[31m%}%m[%~]%%%{[m%} "
#RPROMPT='[%h] (%t)'

# key bind
#
bindkey -e
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#
# WORDCHARS
#
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#
# Options
#
setopt ignore_eof
setopt notify
setopt auto_list
setopt nobeep
setopt auto_pushd

#
# Complementarity
#
autoload -U compinit
compinit
setopt auto_pushd 
compctl -c man which
compctl -g '*.tex' platex jlatex
compctl -g '*.dvi' xdvi dvi2ps
compctl -g '*.ps' gv lpr idraw

#
# Aliases
#
alias ls='ls -F --color=yes'
alias l='ls -lAgs | less -r'
alias less='/usr/bin/less'
alias la='ls -A'
alias ll='ls -l'
alias sl='ls'
alias gdb='emacs -f gdb'

