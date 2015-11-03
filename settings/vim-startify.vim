if (executable('fortune') && executable('cowthink'))
let g:startify_custom_header =
      \ map(split(system('fortune | cowthink'), '\n'), '"   ". v:val') + ['','']
endif

let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
