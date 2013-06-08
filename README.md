# The Cajuns vim conf
![voodoo](https://github.com/cajun/voodoo/raw/master/voodoo.jpg)
I want a clean simple vim configuration.  I'm played around a lot with different
settings and never really liked any of them.  This configuration is the current
incarnation.  It uses [vundler](https://github.com/gmarik/vundle).
[vundler](https://github.com/gmarik/vundle) allows you to easily search,
install, remove, and manage your plugins for vim.  Like most vim users you start
out by pulling in someone else's configuration and you don't know what the hell
anything is doing.  I've spent a fare amount of time tweaking my own config and
allowing other devs use it. Now I believe that I'm on the right path.  So
without further adieu I give you configuration.


## Quick install
``curl https://raw.github.com/cajun/voodoo/master/install.sh | bash``

# Design of the vim configuration
### Features
* Auto Update
* Few Dependencies
  - par ( an awesome formatter <leader>gq )
  - coffee-script
  - ctags
* Has support for
  - ruby
  - haml
  - csv
  - css
  - markdown
  - handlebars

### Directory Layout
  .
  |-- autocommands.vim
  |-- bundle
  |   |-- ( Location for all installed bundles )
  |-- bundles.vim
  |-- completions.vim
  |-- history.log
  |-- install.sh
  |-- local
  |-- mappings.vim
  |-- os.vim
  |-- README.md
  |-- settings
  |   |-- ctrlp.vim
  |   |-- delimitMate.vim
  |   |-- fugitive.vim
  |   |-- gundo.vim
  |   |-- nerdtree.vim
  |   |-- powerline.vim
  |   |-- syntastic.vim
  |   |-- tabular.vim
  |   |-- tagbar.vim
  |   `-- zoomwin.vim
  |-- settings.vim
  |-- tmp
  |   |-- backup
  |   |-- swap
  |   `-- undo
  |-- update.sh
  `-- voodoo.jpg

### Auto updates
TODO: Add docs

## Custom Configuration
TODO: Add docs

## Base setup
TODO: Add docs

# Included Plugins

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [Tabular](https://github.com/godlygeek/tabular)
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [tpope/vim-haml](https://github.com/tpope/vim-haml)
* [tpope/vim-rails](https://github.com/tpope/vim-rails)
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [nelstrom/vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)
* kana/vim-textobj-user
* michaeljsmith/vim-indent-object
* matchit.zip
* Lokaltog/vim-powerline
* kien/ctrlp.vim
* Gundo
* SuperTab
* Tagbar
* delimitMate.vim
* ap/vim-css-color
* altercation/vim-colors-solarized
