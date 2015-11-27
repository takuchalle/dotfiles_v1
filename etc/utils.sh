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
