#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#
umask 022

export DOTPATH=$HOME/.dotfiles

if [ ! -d $DOTPATH ]; then
    echo "Not Found : $DOTPATH"
    exit
fi

# utils
if [ -e $DOTPATH/etc/utils.sh ]; then
    source $DOTPATH/etc/utils.sh
fi

# setup plugins
if [ -e $DOTPATH/etc/plugins.zsh ];then
    source $DOTPATH/etc/plugins.zsh
fi

# 環境固有の設定を読み込み
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# autoload
autoload -U  run-help
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz colors; colors
autoload -Uz vcs_info
autoload -U compinit; compinit

export TERM=xterm-256color

#
# Shell Variables
#
setopt auto_cd
setopt correct
setopt no_beep
setopt ignore_eof
setopt notify
setopt auto_list
setopt auto_pushd
setopt prompt_subst

#
# History
#
SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zhistory
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt share_history

### ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### LESS Color ###
#
export LESS='-R'

#
# Prompt
#
PROMPT='%B%F{red}%n@%m%f %F{white}[%~]%f%b $(git_super_status) '$'\n''%(?,%F{white},%F{blue})➜%f '

# key bind
#
bindkey -e
bindkey -M emacs '^L' backward-kill-word
if zplug check "zsh-users/zsh-history-substring-search"; then
    # bind P and N for EMACS mode
    bindkey -M emacs '^P' history-substring-search-up
    bindkey -M emacs '^N' history-substring-search-down
fi

#
# WORDCHARS
#
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#
# Complementarity
#
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compctl -c man which
compctl -g '*.tex' platex jlatex
compctl -g '*.dvi' xdvi dvi2ps
compctl -g '*.ps' gv lpr idraw

#
# Aliases
#
alias less='/usr/bin/less -R'

os_detect
case "$PLATFORM" in
    linux)
	alias ls='ls --color=auto' ;;
    cygwin)
	alias ls='ls --color=auto' ;;
    osx)
	alias ls='ls -G' ;;
    *)
esac

alias la='ls -A'
alias ll='ls -l'
alias ld='ls -ld'
alias sl='ls'
alias emacs='emacs -nw'
alias gdb='emacs -f gdb'
alias em='emacsclient -t'
alias mv='mv -i'
alias cp='cp -i'
alias tmux='tmux -2'

if is_exists "gom"i; then
    alias rm=gomi
else
    alias rm='rm -i'
fi

#
# tmux 自動起動 
#
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
	tmuxx
    elif type tmux >/dev/null 2>&1; then
	if tmux has-session && tmux list-sessions | grep -qE '.*]$'; then
	    tmux attach && echo "tmux attached session "
	else
	    tmux new-session && echo "tmux created new session"
	fi
    elif type screen >/dev/null 2>&1; then
	screen -rx || screen -D -RR
    fi
fi

#
# emacs 自動起動
#
if ps aux | grep emacs | grep -v grep > /dev/null 2>&1; then
else
    `emacs --daemon > /dev/null`
fi
