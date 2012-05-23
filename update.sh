#!/bin/bash

VIM_UPDATE_LOCK=~/.vim/__update.lock

if [ ! -f $VIM_UPDATE_LOCK ]
then
  touch $VIM_UPDATE_LOCK
  cd ~/.vim
  git pull > /dev/null && vim -es -u ~/.vim/bundles.vim +BundleInstall! +qall > /dev/null
  rm $VIM_UPDATE_LOCK
fi
