" General  =====================================================================
filetype plugin indent on

if (executable('par'))
  set formatprg=par\ -fw70
endif

"set tags =./tags;,./TAGS;,./tmp/tags.,./tmp/TAGS. " Where to look for tags
set tags=tags

set splitright " Always open splits to the right
set spell      " set vim to spell cause i can't

let mapleader = ","
let maplocalleader = "\\"

" Colors  ======================================================================
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
set background=dark

" Pattern Matching =============================================================

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " Highlight conflict markers

highlight Search          ctermbg=black  ctermfg=yellow   cterm=underline
highlight IncSearch       ctermbg=yellow ctermfg=black
highlight ExtraWhitespace ctermbg=red
highlight LongLine        ctermbg=yellow
highlight CursorLine      ctermbg=NONE   cterm=underline

" Temp Files ===================================================================
set undodir=~/.config/nvim/tmp/undo/     " undo files
set backupdir=~/.config/nvim/tmp/backup/ " backups
set directory=~/.config/nvim/tmp/swap/   " swap files
set backup                       " turn on backups
set undofile                     " turn on undos vim 7.3 feature
set undolevels=1000              " how much you can undo
set undoreload=10000

" Settings =====================================================================
set autoread                            " if the buffer changes reload it
set backspace=indent,eol,start          " handle backspace char
set completeopt=longest,menu            " what the complete menu looks like
set hidden                              " handle hidden stuff better
set hlsearch                            " highlight the search
set incsearch                           " highlight the search real-time

set laststatus=2                        " Keep the status line on all windows
set cursorline                          " highlight the current line
set scrolloff=4                         " scroll when within 4 lines above/below
set sidescrolloff=5                     " scroll when within 5 lines left/right

set noerrorbells
set visualbell t_vb=
set lazyredraw

set nolist

set ttimeout
set ttimeoutlen=10

set modelines=0
set noeol
set relativenumber
set numberwidth=4
set shell=bash
set showcmd
set showmatch
set title

set matchtime=5 " blink match chars for .x seconds

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set wildmode=list:longest,full
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
"execute "set colorcolumn=" . join(range(81,200), ',')

if has("multi_byte")

  if !has('nvim')
    set encoding=utf-8
  endif

  set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
endif
