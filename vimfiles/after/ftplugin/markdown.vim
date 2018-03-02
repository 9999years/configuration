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

"enter on a line with just a bullet deletes the bullet
inoremap <expr> <CR> getline('.') =~ '^\s*\* $' ? '<C-u>' : '<CR>'
