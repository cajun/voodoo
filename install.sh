#! /usr/bin/env bash

cd ~
if [[ -d !~/.config/nvim ]]
then
  mv ~/.config/nvim/nvim ~/.config/nvim.old
fi

git clone git://github.com/cajun/voodoo.git ~/.config/nvim

vim -u ~/.vim/plugs.vim +PlugInstall! +":w >> ~/.config/nvim/history.log" +qa!


