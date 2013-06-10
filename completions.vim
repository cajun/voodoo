"" Omni Completion =============================================================
set ofu=syntaxcomplete#Complete

if has('autocmd')
  autocmd FileType html       set omnifunc=html5complete#CompleteTags
  autocmd FileType python     set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType java       set omnifunc=javacomplete#Complete
  autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c          set omnifunc=ccomplete#Complete
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

  autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
  autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
endif

" Auto Complete ================================================================
set complete=.,w,b,u,U,i,t,d
let g:AutoComplPop_CompleteOption = '.,w,b,u,U,i,t,d'
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2
