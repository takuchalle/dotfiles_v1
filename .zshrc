#          _
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|
#
#
umask 022

# utils
if [ -e ./etc/utils.sh ]; then
    source ./etc/utils.sh
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
alias la='ls -A'
alias ll='ls -l'
alias ld='ls -ld'
alias sl='ls'
alias emacs='emacs -nw'
alias gdb='emacs -f gdb'
alias em='emacsclient -t'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

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


#
# view alias のための関数
#
function read_only_emacs() {
    [ -f "$1" ] || (echo "ファイルが見つかりませんでした: $1" >&2; exit 1)
    emacs "$1" --eval '(setq buffer-read-only t)'
}

function read_only_emacsclient() {
    emacsclient -t -e "(find-file-read-only \"$1\")"
}

alias view='read_only_emacsclient'

#
# 圧縮ファイル指定で拡張子に合わせて解凍してくれる
# http://d.hatena.ne.jp/itchyny/20130227/1361933011
function extract() {
    case $1 in
	*.tar.gz|*.tgz) tar xzvf $1;;
	*.tar.xz) tar Jxvf $1;;
	*.zip) unzip $1;;
	*.lzh) lha e $1;;
	*.tar.bz2|*.tbz) tar xjvf $1;;
	*.tar.Z) tar zxvf $1;;
	*.gz) gzip -dc $1;;
	*.bz2) bzip2 -dc $1;;
	*.Z) uncompress $1;;
	*.tar) tar xvf $1;;
	*.arj) unarj $1;;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

