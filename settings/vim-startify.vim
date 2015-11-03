if (executable('fortune') && executable('cowsay'))
let g:startify_custom_header =
      \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
endif

let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
