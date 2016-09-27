" Vundle =======================================================================

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

if has('nvim')
  Plug 'neomake/neomake'
endif

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Plugs

Plug 'Tabular'
"Plug 'Tagbar'
Plug 'Gundo'
Plug 'SuperTab'
Plug 'dbext4rdb'
"Plug 'vimwiki'
"Plug 'mattn/calendar-vim'

"Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'

"Plug 'easymotion/vim-easymotion'

if (executable('ag'))
  Plug 'rking/ag.vim'
endif

"if (executable('coffee'))
"Plug 'vim-coffee-script'
"endif

"if (executable('go'))
"Plug 'Blackrush/vim-gocode'
"endif

if (executable('git'))
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
endif

if (executable('rustc'))
  Plug 'rust-lang/rust.vim'
endif

"Plug 'cespare/vim-toml'

Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdcommenter'
"Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'

if (executable('ruby'))
  Plug 'tpope/vim-rails'
  "Plug 'vim-ruby/vim-ruby'
  Plug 'nelstrom/vim-textobj-rubyblock'
  Plug 'kana/vim-textobj-user'
endif


Plug 'matchit.zip'
Plug 'bling/vim-airline'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'mhartington/oceanic-next'
"Plug 'maxst/flatcolor'
Plug 'ryanoasis/vim-devicons'

" Syntax
Plug 'vim-scripts/csv.vim'
"Plug 'tpope/vim-markdown'
Plug 'othree/yajs.vim'

call plug#end()
