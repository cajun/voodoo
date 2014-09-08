" Ctrlp  =======================================================================
nmap <leader>f :CtrlP<cr>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>m :CtrlPMRU<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>c :CtrlPChange<cr>

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_extensions = ['buffertag', 'line', 'changes', 'quickfix', 'dir', 'rtscript']
let g:ctrlp_user_command = {
      \ 'types': {
      \ 0: ['.ag', 'cd %s && ag -g'],
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }
