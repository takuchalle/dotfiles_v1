#/bin/zsh

FILES=(".emacs.d" ".gitignore" ".tmux.conf" ".zshenv" ".zshrc" ".gemrc" ".screenrc")
PWD=`pwd`
OLDPOSTFIX=".old"

for file in ${FILES[@]}; do
    if [ -e ~/$file -o -d ~/$file ]  
    then
	    mv ~/$file ~/$file$OLDPOSTFIX
    fi
    ln -sf $PWD/$file ~/$file
done
