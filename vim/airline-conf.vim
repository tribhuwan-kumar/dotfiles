" ========================================...Airline
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 80,
      \ 'x': 70,
      \ 'y': 80,
      \ 'z': 40,
      \ 'warning': 40,
      \ 'error': 40,
      \ }

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Theme
let g:airline_theme='dark'

" Airline symbols
let g:airline_section_z = '%2p%% %2l/%L:%1v'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

" Whitespace
let g:airline#extensions#whitespace#enabled = 0
" Tabline
let g:webdevicons_enable_airline_tabline = 1
" Statusline
let g:webdevicons_enable_airline_statusline = 1
" Tagbar
let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#nvimlsp#enabled = 1
let g:airline#extensions#nvimlsp#error_symbol = ' '
let g:airline#extensions#nvimlsp#warning_symbol = ' '
let g:airline#extensions#nvimlsp#show_line_numbers = 1
let g:airline#extensions#nvimlsp#open_lnum_symbol = '('
let g:airline#extensions#nvimlsp#close_lnum_symbol = ')'

