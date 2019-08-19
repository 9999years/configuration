"---AIRLINE---
let g:airline_theme='molokai'
function! AirlineInit()
  AirlineTheme molokai
  let g:airline#extensions#bufferline#enabled=0
  let g:airline#extensions#syntastic#enabled=0
  let g:airline#extensions#whitespace#enabled=0
  let g:airline#extensions#wordcount#enabled=1
  let g:airline#extensions#wordcount#filetypes =
    \ ['markdown', 'rst', 'org', 'help', 'text']
  "let g:airline_section_error = airline#section#create(['branch'])
  let g:airline_section_a     = '%{substitute(mode(), "CTRL-", "^", "g")}'
  let g:airline_section_b     = airline#section#create(['ffenc'])
  "let g:airline_section_error = airline#section#create(['syntastic'])
  "see 'statusline'
  "let g:airline_section_c     = '%{expand(''%:h:t'')}/%t %m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
  let g:airline_section_gutter = '%='
  let g:airline_section_warning = ''
  "let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),0)}'
  let g:airline_section_x = '%{&ft}'
  let g:airline_section_y = ''
  let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr}%4l:%3v'

  if !exists('g:airline_symbols')
    let g:airline_symbols={}
  endif
  let g:airline_symbols.branch='⎇'
  let g:airline_left_sep='' "''
  let g:airline_left_alt_sep='│' "''
  let g:airline_right_sep='' "''
  let g:airline_right_alt_sep='│' "''
  if has('macunix') and !has('nvim')
    let g:airline_symbols.readonly='RO'
    let g:airline_symbols.linenr='L'
  else
    let g:airline_symbols.readonly=''
    let g:airline_symbols.linenr=''
  end
endfunction
autocmd User AirlineAfterInit call AirlineInit()

