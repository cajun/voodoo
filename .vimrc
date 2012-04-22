" vimrc
"
" Have fun!
"
set nocompatible
filetype off

source ~/.janus/bundles.vim
source ~/.janus/settings.vim
source ~/.janus/completions.vim
source ~/.janus/mappings.vim

for f in split(glob('~/.janus/settings/*.vim'), '\n')
  exe 'source' f
endfor