#
# Copyright (c) 2015, TAKUYA Ohashi. All rights reserved.
#
# Utilities for shellscript

export PLATFORM

is_interactive() {
    if [ "${-/i/}" != "$-" ]; then
	return 0
    fi
    return 1
}

is_bash() {
    [ -n "$BASH_VERSION" ]
}

is_zsh() {
    [ -n "$ZSH_VERSION" ]
}

# ostype returns the lowercase OS name
ostype() {
    uname | lower
}

# os_detect export the PLATFORM variable as you see fit
os_detect() {
    export PLATFORM
    case "$(ostype)" in
	*'linux'*)  PLATFORM='linux'   ;;
	*'darwin'*) PLATFORM='osx'     ;;
	*'bsd'*)    PLATFORM='bsd'     ;;
	*'cygwin'*) PLATFORM='cygwin'  ;;
	*)          PLATFORM='unknown' ;;
    esac
}

# shellcheck disable=SC2120
lower() {
    if [ $# -eq 0 ]; then
	cat <&0
    elif [ $# -eq 1 ]; then
	if [ -f "$1" -a -r "$1" ]; then
	    cat "$1"
	else
	    echo "$1"
	fi
    else
	return 1
    fi | tr "[:upper:]" "[:lower:]"
}
# shellcheck disable=SC2120
upper() {
    if [ $# -eq 0 ]; then
	cat <&0
    elif [ $# -eq 1 ]; then
	if [ -f "$1" -a -r "$1" ]; then
	    cat "$1"
	else
	    echo "$1"
	fi
    else
	return 1
    fi | tr "[:lower:]" "[:upper:]"
}

is_exists() {
    which "$1" >/dev/null 2>&1
    return $?
}

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

#
# view alias のための関数
#
function read_only_emacs() {
    [ -f "$1" ] || (echo "No such file: $1" >&2; exit 1)
    emacs "$1" --eval '(setq buffer-read-only t)'
}

function read_only_emacsclient() {
    emacsclient -t -e "(find-file-read-only \"$1\")"
}
alias view='read_only_emacsclient'

