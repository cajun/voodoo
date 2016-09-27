" vimrc
"
" Have fun!
"
filetype off

source ~/.config/nvim/plugs.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/os.vim
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/completions.vim
source ~/.config/nvim/mappings.vim

for f in split(glob('~/.config/nvim/settings/*.vim'), '\n')
  exe 'source' f
endfor

for f in split(glob('~/.config/nvim/local/*.vim'), '\n')
  exe 'source' f
endfor

