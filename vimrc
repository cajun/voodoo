" -----------------------------------------------------------------------------
" |                            VIM Settings                                   |
" |                                                                           |
" | Some highlights:                                                          |
" |   ,n = toggle NERDTree off and on                                         |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" -----------------------------------------------------------------------------

set nocompatible
set shell=/bin/bash

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Auto reload the .vimrc if it changes
autocmd! bufwritepost .vimrc source %

" Sets
set wildmenu " This allows a small menu to appear at the bottom and not a new buffer
set hidden " Allow you to handle buffers better
set wildignore +=vendor/gems/**,vendor/cache/**,tmp/**
set undodir=~/.undo
set undofile
set undolevels=1000
set undoreload=10000

" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize

" Misc ************************************************************************
set backspace=indent,eol,start
set relativenumber " Show line numbers
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how

" Indenting *******************************************************************
set autoindent " Automatically set the indent of a new line (local to buffer)
set smartindent " smartindent	(local to buffer)

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4

" Windows *********************************************************************
" set equalalways " Multiple windows, when created, are equal in size
set splitright
" set splitbelow splitright

" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set ch=2 " Make command line two lines high

" Formatter
set formatprg=par\ -w50

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
"behave xterm
set selectmode=mouse

set autoread " Auto read when a file is changed from the outside

let mapleader=','  " My Leader key

runtime macros/matchit.vim " Mo power for matching with %

" File Stuff ******************************************************************
" To show current filetype use: set filetype
filetype plugin indent on

" functions

" Tabs ************************************************************************

function! Tabstyle_tabs()
  " Using 4 column tabs
  set softtabstop=4
  set shiftwidth=4
  set tabstop=4
  set noexpandtab
  autocmd User Rails set softtabstop=4
  autocmd User Rails set shiftwidth=4
  autocmd User Rails set tabstop=4
  autocmd User Rails set noexpandtab
endfunction


function! Tabstyle_spaces()
  " Use 2 spaces
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
endfunction

call Tabstyle_spaces()


autocmd User Rails Rnavcommand coffee app/coffee -glob=**/* -suffix=.coffee



" Colors **********************************************************************
set t_Co=16 " 256 colors
let g:solarized_termcolors=16
let g:solarized_termtrans=1
syntax on " syntax highlighting

if has('gui_running')
  set guioptions -=T
  set guifont=Anonymous:h22
endif

  set background=dark

colorscheme solarized


" Match ***********************************************************************
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

highlight LongLineWarning ctermbg=red guibg=red
match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 

au BufReadPost,BufNew *.java exe ":compiler ant"
au BufReadPost,BufNew *.xml exe ":compiler ant"


function! g:ToggleNuMode()
  if( &rnu == 1 )
    set nu
  else
    set rnu
  endif
endfunc






" Omni Completion *************************************************************
set ofu=syntaxcomplete#Complete

autocmd FileType html       set omnifunc=html5complete#CompleteTags
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" -----------------------------------------------------------------------------
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------


set tags =./tags,./TAGS,tags,TAGS,./tmp/tags,./tmp/TAGS

" autocomplpop ***************************************************************
" complete option
set complete=.,w,b,u,i,t,k
let g:AutoComplPop_CompleteOption = '.,w,b,u,i,t,k'
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" Tabular
if exists(":Tabularize")
  nmap <Leader>z= :Tabularize /=<CR>
  vmap <Leader>z= :Tabularize /=<CR>
  nmap <Leader>z: :Tabularize /:\zs<CR>
  vmap <Leader>z: :Tabularize /:\zs<CR>
endif


function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" Mappings ********************************************************************
com! W :w

" Auto light pipes in table
noremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Helpful copy lines of last search to new window
nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>
nnoremap <F5> :GundoToggle<CR>

" Copy and Paste to clipborad
vmap <C-c> :<Esc>`>a<CR><Esc>mx`<i<CR><Esc>my'xk$v'y!xclip -selection c<CR>u
map <Insert> :set paste<CR>i<CR><CR><Esc>k:.!xclip -o<CR>JxkJx:set nopaste<CR>

" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
map <F4> :!ruby %<CR>

" NERDTree ********************************************************************
:noremap <Leader>n :NERDTreeToggle<CR>
" Tag List ***************************************************************
map <Leader>r :TlistToggle<CR>

" Window navigation:
" C-H:left C-L:right C-J:up C-K:down
nmap <c-h> <c-w>h<c-w> 
nmap <c-l> <c-w>l<c-w> 
nmap <c-j> <c-w>j<c-w> 
nmap <c-k> <c-w>k<c-w> 


nnoremap <C-L> :call g:ToggleNuMode()<cr>


:noremap <Leader>i :set list!<CR> " Toggle invisible chars

" -----------------------------------------------------------------------------
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

if executable("ack-grep")
  set grepprg=ack-grep\ -H\ --nogroup\ --nocolor
endif


" Mac *************************************************************************
if has("mac")
endif

" Windows *********************************************************************
if has("gui_win32")
endif



" -----------------------------------------------------------------------------
" |                               Startup                                     |
" -----------------------------------------------------------------------------

"set ep=ruby
""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
let &statusline='%{fugitive#statusline()} %<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%10.(Line: %l/%L Col: %c%V %P%)'
