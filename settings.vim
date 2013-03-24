" General  =====================================================================
filetype plugin indent on
set formatprg=par\ -fw50
set tags =./tags,./TAGS,tags,TAGS,./tmp/tags,./tmp/TAGS " Where to look for tags

set splitright " Always open splits to the right
set spell      " set vim to spell cause i can't

let mapleader = ","
let maplocalleader = "\\"

" Colors  ======================================================================
syntax enable
set t_Co=256                   " 256 colors working with OSX Terminal
let g:solarized_termcolors=256 " Use as many as we can
let g:solarized_termtrans=1    " Transparency when we can
set background=dark            " Use Dark instead of Light version
"set background=light            " Use Dark instead of Light version
colorscheme solarized          " Solarized is NICE

" Pattern Matching =============================================================
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight conflict markers

highlight Search ctermbg=black ctermfg=yellow guibg=black guifg=yellow cterm=underline gui=underline
highlight IncSearch ctermbg=yellow ctermfg=black guibg=yellow guifg=black
highlight ExtraWhitespace ctermbg=red guibg=red
highlight LongLine ctermbg=yellow guibg=red


" Temp Files ===================================================================
set undodir=~/.vim/tmp/undo/     " undo files
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " turn on backups
set undofile                     " turn on undos vim 7.3 feature
set undolevels=1000              " how much you can undo
set undoreload=10000

" Settings =====================================================================
set autoread                            " if the buffer changes reload it
set backspace=indent,eol,start          " handle backspace char
set completeopt=longest,menuone,preview " what the complete menu looks like
set hidden                              " handle hidden stuff better
set hlsearch                            " highlight the search
set incsearch                           " highlight the search real-time

set laststatus=2                        " Keep the status line on all windows
set cursorline                          " highlight the current line
set scrolloff=4                         " scroll when within 4 lines above/below
set sidescrolloff=5                     " scroll when within 5 lines left/right
set ttyfast                             " the console is fast so use it

set noerrorbells
set visualbell t_vb=
set lazyredraw

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nolist
set showbreak=↪

set ttimeout
set ttimeoutlen=10

set modelines=0
set noeol
set relativenumber
set numberwidth=6
set shell=/bin/bash
set showcmd
set showmatch

set matchtime=5 " blink match chars for .x seconds

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set nowrap
set smartcase
set smartindent

" White characters =============================================================
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions=qrn1
set colorcolumn=+1

