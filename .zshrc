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
# Left Prompt
#
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-chenges true
function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg
local p_git="%1(v|%1v|)"

local p_cdir="%B%F{red}%n@%m%f [%~]%b $p_git"$'\n'
local p_mark="%(?,%F{white},%F{blue})$%f"
PROMPT="$p_cdir$p_mark "

#
# Right Prompt
#
local p_info="[%h](%T)"
RPROMPT="$p_info"



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
alias emacs='emacs -nw'
alias sl='ls'
alias gdb='emacs -f gdb'

