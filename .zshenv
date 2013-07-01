export EDITOR="emacs -nw"
export PATH="$HOME/.rbenv/bin:$PATH"

# rbenv があるときのみ実行
if [ -x "`which rbenv`" ]; then
    eval "$(rbenv init -)"
fi
