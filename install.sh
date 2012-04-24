#!/bin/bash

cd ~
mv ~/.vim ~/.vim.old

git clone http://github.com/cajun/dot_vim ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -s ~/.vim/.vimrc

vim +BundleInstall +qall
