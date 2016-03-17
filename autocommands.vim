if has('autocmd')

  au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

  " Bad white space ==============================================================
  autocmd BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

  " Triggers =====================================================================
  autocmd FocusLost    * :set number
  autocmd FocusGained  * :set relativenumber

  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber

  autocmd BufRead,BufNewFile *.hamlc set filetype=haml

  autocmd BufRead,BufWrite * :silent! %s/\v\s+$//

  if executable('ant')
    " Android Development ==========================================================
    autocmd BufReadPost,BufNew *.java exe ":compiler ant"
    autocmd BufReadPost,BufNew *.xml exe ":compiler ant"
  endif

  if executable('go')
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
  endif

  autocmd User Startified setlocal buftype=

  autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd Filetype css setlocal ts=4 sts=4 sw=4 expandtab

  autocmd VimLeavePre * silent !source ~/.vim/update.sh > /dev/null &
  " Auto reload vimrc ============================================================
  augroup myvimrc
    autocmd!
    autocmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    autocmd BufWritePost ~/.vim/*.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    autocmd BufWritePost ~/.vim/settings/*.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    autocmd BufWritePost ~/.vim/local/*.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
  augroup END

endif
