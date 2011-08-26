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

" Extras ************************************************************************
set wildmenu " This allows a small menu to appear at the bottom and not a new buffer
set hidden " Allow you to handle buffers better
let mapleader=','  " My Leader key
runtime macros/matchit.vim " Mo power for matching with %

set wildignore +=vendor/gems/**,vendor/cache/**,tmp/**

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

" CTRL-H move to left window
nmap <c-h> <c-w>h<c-w>
" CTRL-L move to right window
nmap <c-l> <c-w>l<c-w>
" CTRL-J move to top window
nmap <c-j> <c-w>j<c-w>
" CTRL-K move to bottom window
nmap <c-k> <c-w>k<c-w>

" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
set t_Co=256 " 256 colors
let g:solarized_termcolors=256

if has('gui_running')
  set guioptions -=T
  set background=light
else
  set background=dark
endif

syntax on " syntax highlighting
colorscheme solarized


" Match ***********************************************************************
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set ch=1 " Make command line two lines high
highlight LongLineWarning ctermbg=red guibg=red
match LongLineWarning '\%120v.*' " Error format when a line is longer than 120

" Formatter
set formatprg=par\ -w50

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Mappings ********************************************************************
com! W :w

" Helpful copy lines of last search to new window
nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" Directories *****************************************************************

" File Stuff ******************************************************************
" To show current filetype use: set filetype
filetype plugin indent on

set autoread " Auto read when a file is changed from the outside

augroup vimrcAu
  au!
  au BufEnter,BufNew *.log setlocal autoread
augroup END


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

function! g:ToggleNuMode()
  if( &rnu == 1 )
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>

" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
"behave xterm
set selectmode=mouse


" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
" map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
set ofu=syntaxcomplete#Complete

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" May require ruby compiled in
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" -----------------------------------------------------------------------------
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------

" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>
" Tag List ***************************************************************
map ,r :TlistToggle<CR>

" autocomplpop ***************************************************************
" complete option
set complete=.,w,b,u,i,t,k
let g:AutoComplPop_CompleteOption = '.,w,b,u,i,t,k'
let g:AutoComplPop_IgnoreCaseOption = 0
let g:AutoComplPop_BehaviorKeywordLength = 2

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

if executable("ack-grep")
  set grepprg=ack-grep\ -H\ --nogroup\ --nocolor
endif


nnoremap <F5> :GundoToggle<CR>
" Tabular
if exists(":Tabularize")
  nmap <Leader>z= :Tabularize /=<CR>
  vmap <Leader>z= :Tabularize /=<CR>
  nmap <Leader>z: :Tabularize /:\zs<CR>
  vmap <Leader>z: :Tabularize /:\zs<CR>
endif

noremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

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



" -----------------------------------------------------------------------------
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------

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
