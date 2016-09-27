" Vundle =======================================================================
set nocompatible
filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'neomake/neomake'

" Plugins
Plugin 'Tabular'
"Plugin 'Tagbar'
Plugin 'Gundo'
Plugin 'SuperTab'
Plugin 'dbext4rdb'
"Plugin 'vimwiki'
"Plugin 'mattn/calendar-vim'

Plugin 'sheerun/vim-polyglot'
Plugin 'mhinz/vim-startify'

Plugin 'easymotion/vim-easymotion'

if (executable('ag'))
 Plugin 'rking/ag.vim'
endif

"if (executable('coffee'))
  "Plugin 'vim-coffee-script'
"endif

"if (executable('go'))
  "Plugin 'Blackrush/vim-gocode'
"endif

if (executable('git'))
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'
endif

if (executable('rustc'))
  Plugin 'rust-lang/rust.vim'
endif

"Plugin 'cespare/vim-toml'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'

if (executable('ruby'))
  Plugin 'tpope/vim-rails'
  "Plugin 'vim-ruby/vim-ruby'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'kana/vim-textobj-user'
endif

Plugin 'matchit.zip'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mhartington/oceanic-next'
Plugin 'maxst/flatcolor'
Plugin 'ryanoasis/vim-devicons'

" Syntax
Plugin 'vim-scripts/csv.vim'
"Plugin 'tpope/vim-markdown'
Plugin 'othree/yajs.vim'
"Plugin 'mxw/vim-jsx'
"Plugin 'tpope/vim-haml'
"Plugin 'groenewege/vim-less'
"Plugin 'digitaltoad/vim-jade'
