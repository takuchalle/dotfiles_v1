# 表示を英語にする
export LANG=en_US.UTF-8
umask 0002

# KCODE に UTF-8 を設定
export KCODE=u

# エディタを ターミナル版の emacs にする
export EDITOR="emacsclient -t"
export GIT_EDITOR="emacsclient -t"

# rbenv のパスを追加
export PATH="$HOME/.rbenv/bin:$PATH"

# rbenv があるときのみ実行
if [ -x "`which rbenv`" ]; then
    eval "$(rbenv init -)"
fi

#
# export setting
#
# エディタを ターミナル版の emacs にする
export EDITOR="emacsclient -t"
export GIT_EDITOR="emacsclient -t"
# 'man' を表示する時は、常に less を利用
export PAGER=less
# less のステータス行にファイル名と行数、いま何%かを表示
export LESS='-X -i -P ?f%f:(stdin).  ?lb%lb?L/%L..  [?eEOF:?pb%pb\%..]'
# rsync では SSH を利用
export RSYNC_RSH=ssh

### ls Color ###
# 色の設定
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.i386.rpm=01;31:*.src.rpm=01;30:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:' ;
export LS_COLORS
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true

alias em='emacsclient -t'
alias emacs='emacs -nw'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'


#
# emacs 自動起動
#
if ps aux | grep emacs | grep -v grep > /dev/null 2>&1; then
else
    `emacs --daemon`
fi


