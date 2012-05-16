#!/bin/bash

cd ~
mv ~/.vim ~/.vim.old
mv ~/.vimrc ~/.vimrc.old

git clone git://github.com/cajun/dot_vim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -sf ~/.vim/.vimrc

vim -u ~/.vim/bundles.vim +BundleInstall +qall
