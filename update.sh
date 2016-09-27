#! /usr/bin/env bash

set -e
VIM_UPDATE_LOCK=/tmp/__update.lock
VIM_HISTORY_LOG=~/.config/nvim/history.log


function cleanUp(){
  if [ -f $VIM_UPDATE_LOCK ]
  then
    date >> $VIM_HISTORY_LOG
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

  echo "Checking remote" >> $VIM_HISTORY_LOG
  # Check to see if the remote is up
  cd ~/.config/nvim
  echo "-- Updating Voodoo" >> $VIM_HISTORY_LOG
  git pull --quiet >> ~/.config/nvim/history.log

  if [ $? -eq 0 ]
  then
    echo "-- Update Start" >> $VIM_HISTORY_LOG
    echo "-- On Line" >> $VIM_HISTORY_LOG


    echo "-- Updating Plugins" >> $VIM_HISTORY_LOG
    vim -c "PlugClean" -c "PlugInstall" -c ":w >> ~/.config/nvim/history.log" -c "qa!" &> /dev/null

    echo "-- Update Complete" >> $VIM_HISTORY_LOG

  else
    echo "-- NOT On Line" >> $VIM_HISTORY_LOG
  fi
  cleanUp
fi

trap - EXIT
trap - ERR
exit 0
