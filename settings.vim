" General  =====================================================================
filetype plugin indent on
set formatprg=par\ -fw50
set tags =./tags,./TAGS,tags,TAGS,./tmp/tags,./tmp/TAGS " Where to look for tags

set splitright
set spell

let mapleader = ","
let maplocalleader = "\\"

" Colors  ======================================================================
set t_Co=256                   " 256 colors working with OSX Terminal
let g:solarized_termcolors=256 " Use as many as we can
let g:solarized_termtrans=1    " Transparency when we can
set background=dark            " Use Dark instead of Light version
colorscheme solarized          " Solarized is NICE
syntax on

" Pattern Matching =============================================================
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight conflict markers

highlight ExtraWhitespace ctermbg=red guibg=red
highlight LongLine ctermbg=yellow guibg=red

autocmd BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Temp Files ===================================================================
if( !isdirectory($HOME . '/.vim/tmp/undo') )
  call mkdir($HOME . '/.vim/tmp/undo', 'p')
endif

if( !isdirectory($HOME . '/.vim/tmp/backup') )
  call mkdir($HOME . '/.vim/tmp/backup', 'p')
endif

if( !isdirectory($HOME . '/.vim/tmp/swap') )
  call mkdir($HOME . '/.vim/tmp/swap', 'p')
endif

set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup

set undofile
set undolevels=1000
set undoreload=10000

" Settings =====================================================================
set autoread
set backspace=indent,eol,start
set completeopt=longest,menuone,preview
set hidden
set hlsearch
set laststatus=2
set cursorline

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nolist
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10

set modelines=0
set noeol
set relativenumber
set numberwidth=10
set shell=/bin/bash
set showcmd

set matchtime=2

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set nowrap

" White characters =============================================================
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions=qrn1
set colorcolumn=+1

" Triggers =====================================================================
autocmd FocusLost    * :set number
autocmd FocusGained  * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

autocmd BufRead,BufNewFile *.hamlc set filetype=haml

" Android Development ==========================================================
autocmd BufReadPost,BufNew *.java exe ":compiler ant"
autocmd BufReadPost,BufNew *.xml exe ":compiler ant"
