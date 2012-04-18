" vimrc
" Author: Zaiste! <oh@zaiste.net>
" Source: https://github.com/zaiste/vimified
"
" Have fun!
"
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" General {{{
Bundle 'mileszs/ack.vim'
Bundle 'Tabular'
Bundle 'fugitive.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/vim-space'
Bundle 'scrooloose/syntastic'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle 'sjl/threesome.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'mirell/vim-matchit'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'vimwiki'
Bundle 'jslint.vim'
Bundle 'Gundo'
Bundle 'SuperTab-continued.'
Bundle 'SuperTab'
Bundle 'Tagbar'
Bundle 'delimitMate.vim'
Bundle 'vimux'
Bundle 'vroom'
Bundle 'css_color.vim'
" }}}

" Haskell {{{
Bundle 'Twinside/vim-syntax-haskell-cabal'
Bundle 'lukerandall/haskellmode-vim'
" }}}

" Colors {{{
Bundle 'sjl/badwolf'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
" }}}

" janus mappings (NOTE: not cleaned up yet ) {{{
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Map the arrow keys to be based on display lines, not physical lines
map <Down> gj
map <Up> gk

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

if has("gui_macvim") && has("gui_running")
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

  " Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

  " Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

  " Map Command-# to switch tabs
  map  <D-0> 0gt
  imap <D-0> <Esc>0gt
  map  <D-1> 1gt
  imap <D-1> <Esc>1gt
  map  <D-2> 2gt
  imap <D-2> <Esc>2gt
  map  <D-3> 3gt
  imap <D-3> <Esc>3gt
  map  <D-4> 4gt
  imap <D-4> <Esc>4gt
  map  <D-5> 5gt
  imap <D-5> <Esc>5gt
  map  <D-6> 6gt
  imap <D-6> <Esc>6gt
  map  <D-7> 7gt
  imap <D-7> <Esc>7gt
  map  <D-8> 8gt
  imap <D-8> <Esc>8gt
  map  <D-9> 9gt
  imap <D-9> <Esc>9gt
else
  " Map command-[ and command-] to indenting or outdenting
  " while keeping the original selection in visual mode
  vmap <A-]> >gv
  vmap <A-[> <gv

  nmap <A-]> >>
  nmap <A-[> <<

  omap <A-]> >>
  omap <A-[> <<

  imap <A-]> <Esc>>>i
  imap <A-[> <Esc><<i

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  nmap <C-k> [e
  nmap <C-j> ]e

  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv
  vmap <C-k> [egv
  vmap <C-j> ]egv

  " Make shift-insert work like in Xterm
  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>

  " Map Control-# to switch tabs
  map  <C-0> 0gt
  imap <C-0> <Esc>0gt
  map  <C-1> 1gt
  imap <C-1> <Esc>1gt
  map  <C-2> 2gt
  imap <C-2> <Esc>2gt
  map  <C-3> 3gt
  imap <C-3> <Esc>3gt
  map  <C-4> 4gt
  imap <C-4> <Esc>4gt
  map  <C-5> 5gt
  imap <C-5> <Esc>5gt
  map  <C-6> 6gt
  imap <C-6> <Esc>6gt
  map  <C-7> 7gt
  imap <C-7> <Esc>7gt
  map  <C-8> 8gt
  imap <C-8> <Esc>8gt
  map  <C-9> 9gt
  imap <C-9> <Esc>9gt
endif

""
"" Command-Line Mappings
""

" Insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>
" }}}

" General {{{
filetype plugin indent on
set t_Co=256                   " 256 colors working with OSX Terminal
let g:solarized_termcolors=256 " Use as many as we can
let g:solarized_termtrans=1    " Transparency when we can
set background=dark            " Use Dark instead of Light version
colorscheme solarized          " Solarized is NICE
"colorscheme badwolf

syntax on

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ExtraWhitespace ctermbg=red guibg=red
highlight LongLine ctermbg=yellow guibg=red

autocmd BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Formatter
set formatprg=par\ -w50

let mapleader = ","
let maplocalleader = "\\"
" }}}

" Mappings {{{

map Y y$

" clear highlight after search
noremap <silent><Leader>/ :nohls<CR>
map ,i :set list!<CR> " Toggle invisible chars


" }}}

" Settings {{{
set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set hidden
set history=1000
set incsearch
set laststatus=2
set cursorline
"set list

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nolist
set showbreak=↪

set notimeout
set ttimeout
set ttimeoutlen=10



" _ backups {{{
set undodir=~/.vim/tmp/undo/     " undo files
" NOTE: must move to this dir
"set undodir=~/.undo
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup

set undofile
set undolevels=1000
set undoreload=10000
" _ }}}

set modelines=0
set noeol
set number
set relativenumber
set numberwidth=10
set ruler
set shell=/bin/zsh
set showcmd

set matchtime=2

set completeopt=longest,menuone,preview

" White characters {{{
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set formatoptions=qrn1
set colorcolumn=+1
" }}}

set visualbell

set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set nowrap

set dictionary=/usr/share/dict/words
" }}}

" Triggers {{{

" Save when losing focus
au FocusLost    * :silent! wall

au FocusLost    * :set number
au FocusGained  * :set relativenumber

au InsertEnter * :set number
au InsertLeave * :set relativenumber


" }}}

" Cursorline {{{
" Only show cursorline in the current window and in normal mode.
"augroup cline
    "au!
    "au WinLeave * set nocursorline
    "au WinEnter * set cursorline
    "au InsertEnter * set nocursorline
    "au InsertLeave * set cursorline
"augroup END
" }}}

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" . searching {{{

" sane regexes
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set gdefault
set hlsearch

" clear search matching
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Don't jump when using * for search
nnoremap * *<c-o>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Begining & End of line in Normal mode
"noremap H ^
"noremap L g_

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C->l
nnoremap <leader>d <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" vertical window split
noremap <leader>v <C-w>v

" horizontal window split
noremap <leader>s <C-w>s

" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
" }}}
" }}}

" . folding {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Enter> za
vnoremap <Enter> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
"
" Quick editing {{{

nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>es <C-w>s<C-w>j:e ~/.vim/snippets/<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>

" }}}

" --------------------

set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" showmarks
let g:showmarks_enable = 1
hi! link ShowMarksHLl LineNr
hi! link ShowMarksHLu LineNr
hi! link ShowMarksHLo LineNr
hi! link ShowMarksHLm LineNr

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" delimitMate
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 1

" nerdcommenter
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>

" ,t to show tags window
nmap <leader>t :TagbarToggle<CR>

" sessionman
"nmap <leader>S :SessionList<CR>
"nmap <leader>SS :SessionSave<CR>
"nmap <leader>SA :SessionSaveAs<CR>

" minibufexpl
"let g:miniBufExplVSplit = 25
"let g:miniBufExplorerMoreThanOne = 100
"let g:miniBufExplUseSingleClick = 1
"nmap <Leader>B :MiniBufExplorer<cr>
nmap <leader><C-b> :BuffergatorToggle<cr>

" yankring
let g:yankring_replace_n_pkey = '<leader>['
let g:yankring_replace_n_nkey = '<leader>]'
nmap <leader>y :YRShow<cr>


" Fugitive
" ,e for Ggrep
nmap <leader>g :Ggrep

nnoremap <F5> :GundoToggle<CR>
" Tabular
nmap <Leader>x= :Tabularize /=<CR>
vmap <Leader>x= :Tabularize /=<CR>
nmap <Leader>x: :Tabularize /:\zs<CR>
vmap <Leader>x: :Tabularize /:\zs<CR>

" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>gf :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" same in visual mode
:vmap <leader>gf y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>


" vim-indentobject
let g:indentobject_meaningful_indentation = ["haml", "sass", "python", "yaml", "markdown"]

" Hammer
nmap <leader>p :Hammer<cr>


" }}}

" _ Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" PLUGINS {{{

" _ Ack {{{
nnoremap <leader>a :Ack!<space>
" }}}

" _ Powerline {{{
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1
" }}}

" }}}

" Extensions {{{

" _ Scratch {{{

"command! ScratchToggle call ScratchToggle()

"function! ScratchToggle()
    "if exists("w:is_scratch_window")
        "unlet w:is_scratch_window
        "exec "q"
    "else
        "exec "normal! :Sscratch\<cr>\<C-W>J:resize 13\<cr>"
        "let w:is_scratch_window = 1
    "endif
"endfunction

"nnoremap <silent> <leader><tab> :ScratchToggle<cr>

" }}}

" _ Gist {{{
" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" }}}

" }}}

" TEXT OBJECTS {{{

" Shortcut for [] motion {{{
onoremap ir i[
onoremap ar a[
vnoremap ir i[
vnoremap ar a[
" }}}

" }}}

" Old Vim Config {{{
"au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
au BufRead,BufNewFile *.hamlc set filetype=haml

" Android Development
au BufReadPost,BufNew *.java exe ":compiler ant"
au BufReadPost,BufNew *.xml exe ":compiler ant"

com! W :w
nmap <leader>f :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>m :CtrlPMRU<cr>
nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

"" Omni Completion *************************************************************

autocmd FileType html set omnifunc=html5complete#CompleteTags
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" Where to look for tags
set tags =./tags,./TAGS,tags,TAGS,./tmp/tags,./tmp/TAGS

" autocomplpop ***************************************************************
 "complete option
"set complete=.,w,b,u,i,t,k
"let g:AutoComplPop_CompleteOption = '.,w,b,u,i,t,k'
"let g:AutoComplPop_IgnoreCaseOption = 0
"let g:AutoComplPop_BehaviorKeywordLength = 2


" CtrlP
let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files'],
  \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
  \ },
\ 'fallback': 'find %s -type f'
\ }

let g:NERDTreeWinPos = "right"

" }}}