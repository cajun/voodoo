" Powerline ====================================================================

if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
else
  let g:Powerline_symbols = 'fancy'
endif

let g:Powerline_cache_enabled = 1
let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
