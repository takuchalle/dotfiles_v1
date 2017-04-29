# 表示を英語にする
export LANG=en_US.UTF-8

# KCODE に UTF-8 を設定
export KCODE=u

# エディタを ターミナル版の emacs にする
export EDITOR="emacsclient -t"
export GIT_EDITOR="emacsclient -t"

# rbenv setting 
if [ -e $HOME/.rbenv/bin ] ;then
    export PATH="$HOME/.rbenv/bin:$PATH"
    # rbenv init if exist
    if [ -x "`which rbenv`" ]; then
	eval "$(rbenv init -)"
    fi
fi

# path to go/bin
if [ -e $HOME/go/bin ] ;then
    export PATH="$HOME/go/bin:$PATH"
fi

# path to cask
if [ -e $HOME/.cask/bin ] ;then
    export PATH="$HOME/.cask/bin:$PATH"
fi

# path to zplug
if [ -e /usr/local/opt/zplug ] ; then
    export ZPLUG_HOME=/usr/local/opt/zplug
    export PATH="$ZPLUG_HOME/bin:$PATH"
elif [ -e $HOME/.zplug ] ;then
    export ZPLUG_HOME=$HOME/.zplug
    export PATH="$ZPLUG_HOME/bin:$PATH"
fi

export PATH="$HOME/.go/bin:$PATH"

export LESSCHARSET='utf-8'
