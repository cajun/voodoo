#!/bin/bash

VIM_UPDATE_LOCK=~/.vim/__update.lock

if [ ! -f $VIM_UPDATE_LOCK ]
then
  touch $VIM_UPDATE_LOCK
  cd ~/.vim
  git remote set-url origin git://github.com/cajun/voodoo.git
  git pull > /dev/null && vim -e -s +BundleClean! +BundleInstall! +qall > /dev/null
  rm $VIM_UPDATE_LOCK
fi
