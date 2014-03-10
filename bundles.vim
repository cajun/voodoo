" Vundle =======================================================================
set nocompatible
filetype off


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" Bundles
Bundle 'Tabular'
Bundle 'Gundo'
Bundle 'SuperTab'

if (executable('ctags'))
  Bundle 'Tagbar'
endif

if (executable('coffee'))
  Bundle 'vim-coffee-script'
endif

if (executable('go'))
  Bundle 'Blackrush/vim-gocode'
endif

Bundle 'delimitMate.vim'
Bundle 'tpope/vim-endwise'

if (executable('git'))
  Bundle 'tpope/vim-fugitive'
endif

Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

if (executable('ruby'))
  Bundle 'tpope/vim-rails'
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'nelstrom/vim-textobj-rubyblock'
  Bundle 'kana/vim-textobj-user'
  "Bundle 'michaeljsmith/vim-indent-object'
endif

Bundle 'matchit.zip'
Bundle 'maciakl/vim-neatstatus'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
" Syntax
Bundle 'vim-scripts/csv.vim'
Bundle 'tpope/vim-markdown'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'tpope/vim-haml'
