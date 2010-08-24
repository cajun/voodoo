" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |                                                                           |
" |   ,r = open tag list                                                      |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
"
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  


set nocompatible
if has('mac')
  set shell=/bin/bash
endif

filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Auto reload the .vimrc if it changes
autocmd! bufwritepost .vimrc source %

" Extras ************************************************************************
set wildmenu " This allows a small menu to appear at the botttom and not a new buffer
set hidden " Allow you to handle buffers better
let mapleader = ","  " My Leader key
runtime macros/matchit.vim " Mo power for matching with %



" Tabs ************************************************************************
"set sta " a <Tab> in an indent inserts 'shiftwidth' spaces

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
set ai " Automatically set the indent of a new line (local to buffer)
set si " smartindent	(local to buffer)


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>


" Cursor highlights ***********************************************************
set cursorline
"set cursorcolumn


" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase


" Colors **********************************************************************
if has('gui_running')
  set guioptions -=T
endif

set t_Co=256 " 256 colors
set background=dark 
syntax on " syntax highlighting
"colorscheme ir_black
colorscheme vibrantink
 

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
set ch=2 " Make command line two lines high
" match LongLineWarning '\%120v.*' " Error format when a line is longer than 120

" Formatter
set formatprg=par

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
imap uu _
imap hh =>
imap aa @

" Helpful copy lines of last search to new window
nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" Directories *****************************************************************
" Setup backup location and enable
" set backupdir=~/backup/vim
" set backup

" Set Swap directory
" set directory=~/backup/vim/swap

" Sets path to directory buffer was loaded from
" autocmd BufEnter * lcd %:p:h


" File Stuff ******************************************************************
filetype plugin indent on
" To show current filetype use: set filetype

"autocmd FileType html :set filetype=xhtml 
set autoread " Auto read when a file is changed from the outside

" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>



" Sessions ********************************************************************
" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


" Misc ************************************************************************
set backspace=indent,eol,start
set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off bell, this could be more annoying, but I'm not sure how


" Invisible characters *********************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap ,i :set list!<CR> " Toggle invisible chars


" Mouse ***********************************************************************
set mouse=a " Enable the mouse
"behave xterm
"set selectmode=mouse


" Ruby stuff ******************************************************************
"compiler ruby         " Enable compiler support for ruby
map <F5> :!ruby %<CR>


" Omni Completion *************************************************************
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

" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1

" Single click for everything
" let NERDTreeMouseMode=1


" Tag List ***************************************************************
"map ,r :TlistToggle<CR>

" autocomplpop ***************************************************************
" complete option
"set complete=.,w,b,u,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,t,k'
"set complete=.
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" -----------------------------------------------------------------------------  
" |                             OS Specific                                   |
" |                      (GUI stuff goes in gvimrc)                           |
" -----------------------------------------------------------------------------  

" Mac *************************************************************************
"if has("mac") 
  "" 
"endif
 
" Windows *********************************************************************
"if has("gui_win32")
  "" 
"endif



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
" let &statusline='[%{exists('g:loaded_rvm')?Rvm#statusline()}][%{GitBranch()}] %<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%10.(Line: %l/%L Col: %c%V %P%)'
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction




