if exists("b:did_md_ftplugin") | finish | endif
let b:did_md_ftplugin=1

"wrap text
setlocal textwidth=80

"spellcheck
setlocal spell

"space tabs in markdown
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

"join comment lines, numbered lists, etc
setlocal formatoptions+=rojn

setlocal comments=b:*,b:-,b:+,n:>

command! Integral :normal o⌠<CR>⌡<ESC>ka <ESC>
command! Sum :normal o⎲<CR>⎳<CR><ESC>kA <ESC>
command! Parenl :normal mzo⎛<CR>⎜<CR>⎝<ESC><C-V>kk"gyVjj"jd`z"gP
command! Parenr :normal mzo⎞<CR>⎟<CR>⎠<ESC><C-V>kk"gyVjj"jd`z"gP
command! Bar :s/-/─/g | s/\([^─]\)─\([^─]\)/\1-\2/g
command! Barv :s/|/│/g

"enter on a line with just a bullet deletes the bullet
inoremap <expr> <CR> getline('.') =~ '^\s*\* $' ? '<C-u>' : '<CR>'
inoremap <expr> *<Space> getline('.') =~ '\v^\s*$' ? '<BS><BS>* ' : '* '
