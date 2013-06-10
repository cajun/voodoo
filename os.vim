if has('win32')
  if has('gui')
    set guifont=Droid_Sans_Mono_for_Powerline:h18
    set guioptions -=T
    highlight Normal guibg=#222222
  endif


else
  " Possible won't work in windows
  "set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
endif
