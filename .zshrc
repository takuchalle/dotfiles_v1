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

# 環境固有の設定を読み込み
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# autoload
autoload -U  run-help
autoload -Uz add-zsh-hook
autoload -Uz cdr
autoload -Uz colors; colors
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
add-zsh-hook precmd _update_vcs_info_msg
local p_git="%1(v|%1v|)"

local p_cdir="%B%F{red}%n@%m%f [%~]%b %F{yellow}$p_git%f"$'\n'
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
    `emacs --daemon`
fi

if [ -e ~/.zplug/zplug ];then
    source ~/.zplug/zplug
    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "junegunn/fzf-bin", as:command, from:gh-r, file:fzf
    zplug "b4b4r07/enhancd", at:v1

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
