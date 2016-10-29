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
Works with Linux, OS X, and Windows ( from git shell )

```
curl https://raw.githubusercontent.com/cajun/voodoo/master/install.sh | bash
```


# Design of the vim configuration


## Features
```
* general short cuts ( listed under mappings.vim )
  - Leader = ,
  - <leader>i toggle invisible chars
  - w!! sudo save
  - <C-h> change to the buffer on the left
  - <C-j> change to the buffer below
  - <C-k> change to the buffer above
  - <C-l> change to the buffer on the right
  - <leader>ev open vimrc file
  - <leader>eg open gitconfig file
  - <leader>et open tmux config file
  - <leader>ef open fishshell config file
  - <leader>eb open bash config file
  - <leader>ez open zsh config file
* plugin shortcuts
  * CtrlP
    - <leader>f open CtrlP in file mode
    - <leader>b open CtrlP in buffer mode
    - <leader>m open CtrlP in most recent file mode
  * Fugitive
    - <leader>gb :Gblame
    - <leader>gs :Gstatus
    - <leader>gd :Gdiff
    - <leader>gl :Glog
    - <leader>gc :Gcommit
    - <leader>gp :Git push
    - <leader>gf git grep for word under cursor ( works in visual too )
  * Gundo
    - F5 toggle gundo
  * NERDTree
    - <leader>n toggle nerd tree
  * Tabular
    - <leader>x= align assignments
    - <leader>x: align : with : left justified
  * Tagbar
    - <leader>t toggle tagbar
* Auto Update
* Has support for
  - coffee-script ( when installed )
  - ctags ( when installed )
  - par ( an awesome formatter <leader>gq )
  - ruby ( when installed )
  - haml
  - csv
  - css
  - markdown
  - handlebars
  - exuberant ctags ( when installed )
```

## Auto updates
The auto update script executes every time that you close vim.
  1. Check to see if another update is running
  2. Check if github is up (ping github.com)
  3. Git the latest of version of voodoo
  4. Pull down latest version of plugins

NOTE: this history of the last update is kept in ~/.vim/history.log

## Custom Configuration
You can add custom configurations in voodoo.  Any .vim file put into local will
be loaded at the end of the vimrc process,  therefore allowing you to override
any of the existing settings.  If you want any custom bundle put them in
local/bundle.vim and they will get installed with the rest of the bundles.


# Directory Layout
```
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
  |-- settings.vim
  |-- tmp
  |   |-- backup
  |   |-- swap
  |   `-- undo
  |-- update.sh
  `-- voodoo.jpg
```


# Included Plugins ( and dependencies )

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
  - coffee script required
* [Tabular](https://github.com/godlygeek/tabular)
* [tpope/vim-endwise](https://github.com/tpope/vim-endwise)
* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
  - git required
* [tpope/vim-haml](https://github.com/tpope/vim-haml)
  - haml required
* [tpope/vim-rails](https://github.com/tpope/vim-rails)
  - rails required
* [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
* [tpope/vim-surround](https://github.com/tpope/vim-surround)
* [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
* [nelstrom/vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)
  - ruby required
* kana/vim-textobj-user
* michaeljsmith/vim-indent-object
* matchit.zip
* Lokaltog/vim-powerline
  - powerline fonts can make better
* kien/ctrlp.vim
* Gundo
  - vim 7.3
* SuperTab
* Tagbar
  - exuberant ctags required
* delimitMate.vim
* ap/vim-css-color
* altercation/vim-colors-solarized
