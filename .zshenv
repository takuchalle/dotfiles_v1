# 表示を英語にする
export LANG=en_US.UTF-8

# KCODE に UTF-8 を設定
export KCODE=u

# エディタを ターミナル版の emacs にする
export EDITOR="emacs -nw"

# rbenv のパスを追加
export PATH="$HOME/.rbenv/bin:$PATH"

# rbenv があるときのみ実行
if [ -x "`which rbenv`" ]; then
    eval "$(rbenv init -)"
fi
