if exists('g:did_filetypes_aucmds') | finish | endif
let g:did_filetypes_aucmds = 1

autocmd BufRead *.cls set filetype=tex

let g:tex_flavor = 'latex'
"no spellchecking in tex comments
let g:tex_comment_nospell= 1
let g:vimtex_compiler_enabled=0
let g:vimtex_include_search_enabled=0
let g:vimtex_view_enabled=0
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_imaps_leader='@'
let g:polyglot_disabled = ['latex']
