# The Cajuns vim conf
![voodoo](https://github.com/cajun/voodoo/raw/master/voodoo.jpg)
I want a clean simple vim configuration.  I'm played around a lot with different
settings and never really liked any of them.  This configuration is the current
incarnation.  It uses [vundler](https://github.com/gmarik/vundle).
[vundler](https://github.com/gmarik/vundle) allows you to easily search,
install, remove, and manage your plugins for vim.  Like most vim users you start
out by pulling in someone else's configuration and you don't know what the hell
anything is doing.  I've spent a fare amount of time tweaking my own config and
allowing other devs use it. Now I believe that I'm on the right path.  so
without further adieu I give you configuration.


## Quick install
``curl https://raw.github.com/cajun/voodoo/master/install.sh | bash``

# Included Plugins

## [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)

Coffee script is a better way to write javascript.  NOTE: you will still need to
learn javascript.  You need to understand how javascript handles things like
`self`.

This plugin manages the all things coffee....

## [Tabular](https://github.com/godlygeek/tabular)

Because I like things to line up.  Think about the following code:
```
shrimp = 'tasty'
crawfish = 'mo tasty'
crab = 'mmmmmmmm'
```

compaired to
```
:Tabularize /=
shrimp   = 'tasty'
crawfish = 'mo tasty'
crab     = 'mmmmmmmm'
```

or

```
:Tabularize /=\zs
shrimp =    'tasty'
crawfish =  'mo tasty'
crab =      'mmmmmmmm'
```

## [tpope/vim-endwise](https://github.com/tpope/vim-endwise)
Hey I (vim) know how to end that method/if/stuff.  Let me do it for you

## [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
Git in vim.....really really good git in vim.  Learn this plugin and you will be
very happy

## [tpope/vim-haml](https://github.com/tpope/vim-haml)
Haml just like Html but with out all the brackets

## [tpope/vim-rails](https://github.com/tpope/vim-rails)
If you use rails this plugin will help you navigate rails easily

## [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
This plugin gives the ``.``` more supper powers.  I just this a lot with
surround.

## [tpope/vim-surround](https://github.com/tpope/vim-surround)
Things needs to be surrounded.  This does just that.  Select a region some how
and tell this plugin to wrap it in Chunky Bacon.

## [tpope/vim-unimpaired](https://github.com/tpope/vim-unimpaired)
Unimpaired give lots of little helpers.  The ones that I use are the ones
dealing with the quick window.  It allows easier navigation +lots more.

## [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
The nerd know how to comment.  I don't want to deal with the specifics. So i use
the nerd.

## [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
This plugin gives you a very nice directory tree to view your files.  It has
a preview option. It is handy to give you familiar way to find your files.

## [scrooloose/syntastic](https://github.com/scrooloose/syntastic)
When working with dynamic languages it's easy to have syntax errors that you
don't catch until you execute the code.  That is where syntastic comes in.  It
will run your code against a syntax checker to validate it before you execute
it.

## [nelstrom/vim-textobj-rubyblock](https://github.com/nelstrom/vim-textobj-rubyblock)
This plugins has a few dependencies, which are listed below.  It will allow you
to easliy select ruby objects.  `var` and `vir` will select to correct ruby
block of code.

## kana/vim-textobj-user
## michaeljsmith/vim-indent-object
## matchit.zip
## Lokaltog/vim-powerline
## kien/ctrlp.vim
## Gundo
## SuperTab
## Tagbar
## delimitMate.vim
## ap/vim-css-color
## altercation/vim-colors-solarized
