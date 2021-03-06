" General Mappings =============================================================
com! W :w
com! WQ :wq
com! Q :q
com! Wall :wall

map <leader>d !!date<CR> " Insert Date
map <leader>i :set list!<CR> " Toggle invisible chars
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Easy Buffer Navigation =======================================================
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

if has('nvim')
  " Hack to get C-h working in NeoVim
  nmap <BS> <C-W>h
endif

" Shortcut to config files =====================================================
nnoremap <leader>ev <C-w>s<C-w>j:e $MYVIMRC<cr>
nnoremap <leader>eg <C-w>s<C-w>j:e ~/.gitconfig<cr>
nnoremap <leader>ef <C-w>s<C-w>j:e ~/.config/fish/config.fish<cr>
nnoremap <leader>eb <C-w>s<C-w>j:e ~/.bashrc<cr>
nnoremap <leader>ez <C-w>s<C-w>j:e ~/.zshrc<cr>
nnoremap <leader>et <C-w>s<C-w>j:e ~/.tmux.conf<cr>
