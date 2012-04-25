#!/bin/bash

cd ~
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old

git clone git://github.com/cajun/dot_vim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.vim/.vimrc

vim +BundleInstall +qall
