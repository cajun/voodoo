#! /usr/bin/env bash

set -e
VIM_UPDATE_LOCK=~/.vim/__update.lock
VIM_HISTORY_LOG=~/.vim/history.log


function cleanUp(){
  if [ -f $VIM_UPDATE_LOCK ]
  then
    rm $VIM_UPDATE_LOCK
  fi
}

function endError(){
  echo "ERROR -- ${LINENO}" >> $VIM_HISTORY_LOG
  cleanUp
}

trap endError ERR
trap cleanUp EXIT

if [ ! -f $VIM_UPDATE_LOCK ]
then
  touch $VIM_UPDATE_LOCK

  date > $VIM_HISTORY_LOG

  #ping -q -w 1 -c 1 www.github.com > /dev/null && OnLine=1 || echo error
  ping -q -c 1 www.github.com > /dev/null && OnLine=1 || echo error

  if [ $OnLine  ]
  then
    echo "-- Update Start" >> $VIM_HISTORY_LOG
    echo "-- On Line" >> $VIM_HISTORY_LOG

    cd ~/.vim

    echo "-- Updating Voodoo" >> $VIM_HISTORY_LOG
    git pull >> ~/.vim/history.log
    echo "-- Updating Bundles" >> $VIM_HISTORY_LOG
    vim -c "BundleClean!" -c "BundleInstall!" -c ":w >> ~/.vim/history.log" -c "qa!" &> /dev/null

    date >> $VIM_HISTORY_LOG
    echo "-- Update Complete" >> $VIM_HISTORY_LOG

  else
    echo "-- NOT On Line" >> $VIM_HISTORY_LOG
  fi
  cleanUp
fi

trap - EXIT
trap - ERR
exit 0
