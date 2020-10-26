if exists('g:did_tex_config') | finish | endif
let g:did_tex_config = 1

let g:tex_flavor = 'latex'
" No spellchecking in TeX comments.
let g:tex_comment_nospell = 1
" Don't compile TeX documents.
let g:vimtex_compiler_enabled = 0
let g:vimtex_include_search_enabled = 0
" Don't open a viewer.
let g:vimtex_view_enabled = 0
" Don't open a quickfix window if there's errors.
let g:vimtex_quickfix_mode = 0
" Use @ for insert-mode abbreviations, rather than backtick.
let g:vimtex_imaps_leader = '@'
" Conceal accents, bold/italic, delimiters, math symbols, greek, and
" super/subscripts.
let g:tex_conceal = 'abdmgs'
