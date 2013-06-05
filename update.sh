#! /usr/bin/env bash

#set -e
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

trap cleanUp EXIT
trap endError ERR

if [ ! -f $VIM_UPDATE_LOCK ]
then
  date > $VIM_HISTORY_LOG
  for interface in $(ls /sys/class/net/ | grep -v lo);
  do
    if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]]; then OnLine=1; fi
  done

  if [ $OnLine  ]
  then
    echo "-- Update Start" >> $VIM_HISTORY_LOG
    echo "-- On Line" >> $VIM_HISTORY_LOG

    touch $VIM_UPDATE_LOCK
    cd ~/.vim

    echo "-- Updating Voodoo/Bundler" >> $VIM_HISTORY_LOG
    git pull >> ~/.vim/history.log && vim -X --noplugin +BundleClean! +BundleInstall! +":w >> ~/.vim/history.log" +qa! &> /dev/null

    date >> $VIM_HISTORY_LOG
    echo "-- Update Complete" >> $VIM_HISTORY_LOG
  else
    echo "-- NOT On Line" >> $VIM_HISTORY_LOG
  fi
fi

trap - EXIT
trap - ERR
cleanUp
exit 0
