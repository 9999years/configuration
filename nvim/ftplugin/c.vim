if exists("b:did_C_ftplugin")
  finish
endif
let b:did_C_ftplugin = 1

setl ts=2
setl sw=2

"complete a classical C comment: '/*' => '/* | */'
inoremap  <buffer>  /*       /*<Space><Space>*/<Left><Left><Left>

"complete a classical C multi-line comment: 
"                      '/*<CR>' =>  /*
"                                    * |
"                                    */
inoremap  <buffer>  /*<CR>  /*<CR><CR>/<Esc>kA<Space>

" additional mapping : {<CR> always opens a block
inoremap  <buffer>  {<CR>    {<CR>}<Esc>O

"<CR> on line with only // deletes comment
imap <expr> <CR> getline('.') =~ '^\s*\/\/\s*$' ? '<C-u>' : '<CR>'

"use //
autocmd BufEnter,BufWinEnter *.c,*.h let b:NERD_c_alt_style = 1
