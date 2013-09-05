#!/bin/bash

[ -f ~/.vimrc ] &&  mv ~/.vimrc ~/.vimrc.bak
[ -d ~/.vim ] && mv ~/.vim ~/.vim.bak
ln -s  `pwd`/.vimrc ~/.vimrc
ln -s  `pwd`/.vim ~/.vim

rm ~/.bash_aliases
ln -sf `pwd`/.bash_aliases ~/.bash_aliases

[ -d ~/bin ] || mkdir ~/bin

for p in bin/*
do
    pname=`basename $p`
    [ -L ~/bin/$pname ] && rm ~/bin/$pname 
    ln -s `pwd`/$p ~/bin/$pname
done

