#!/bin/bash

rm ~/.vimrc
rm -rf ~/.vim
ln -s  `pwd`/.vimrc ~/.vimrc
ln -s  `pwd`/.vim ~/.vim

cp .bash_aliases ~/
