#! /usr/bin/env bash

cd ~
if [[ -d !~/.vim ]]
then
  mv ~/.vim ~/.vim.old
  mv ~/.vimrc ~/.vimrc.old
fi

if [[ -d !~/_vim ]]
then
  mv ~/_vim ~/_vim.old
  mv ~/_vimrc ~/_vimrc.old
fi

git clone git://github.com/cajun/voodoo.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -sf ~/.vim/.vimrc

vim -u ~/.vim/bundles.vim +BundleInstall! +":w >> ~/.vim/history.log" +qa!


