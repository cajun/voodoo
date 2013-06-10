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

Bundle 'delimitMate.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'

if (executable('ruby'))
  Bundle 'vim-ruby/vim-ruby'
  Bundle 'nelstrom/vim-textobj-rubyblock'
endif

Bundle 'kana/vim-textobj-user'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'ap/vim-css-color'
Bundle 'altercation/vim-colors-solarized'
" Syntax
Bundle 'nono/vim-handlebars'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/csv.vim'
" Tring out new javascript lib
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'tpope/vim-haml'

" Load User bundles as well ====================================================
if filereadable("~/.vim/local/bundles.vim")
  source ~/.vim/local/bundles.vim
endif
