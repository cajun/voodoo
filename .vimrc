" vimrc
"
" Have fun!
"
set nocompatible
filetype off

source ~/.vim/bundles.vim
source ~/.vim/settings.vim
source ~/.vim/autocommands.vim
source ~/.vim/completions.vim
source ~/.vim/mappings.vim

for f in split(glob('~/.vim/settings/*.vim'), '\n')
  exe 'source' f
endfor

" section for trying to focus on visual selection
silent !source ~/.vim/update.sh 2>&1 &
