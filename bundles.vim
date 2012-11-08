" Vundle =======================================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"" Bundles
Bundle 'Tabular'
Bundle 'Gundo'
Bundle 'SuperTab'
Bundle 'Tagbar'
Bundle 'vim-coffee-script'
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
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'ap/vim-css-color'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
" Syntax
Bundle 'nono/vim-handlebars'
"Bundle 'cakebaker/scss-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/csv.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-haml'

" Load User bundles as well ====================================================
if filereadable("~/.vim/local/bundles.vim")
  source ~/.vim/local/bundles.vim
endif
