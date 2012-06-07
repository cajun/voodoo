#!/bin/bash

VIM_UPDATE_LOCK=~/.vim/__update.lock

if [ ! -f $VIM_UPDATE_LOCK ]
then
  touch $VIM_UPDATE_LOCK
  cd ~/.vim
  git pull origin master > /dev/null && vim -e -s -u ~/.vim/bundles.vim $VIM_UPDATE_LOCK +BundleClean! +BundleInstall! +qall > /dev/null
  rm $VIM_UPDATE_LOCK
fi
