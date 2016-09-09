if exists("b:did_md_ftplugin") | finish | endif

"spellcheck
setlocal spell

"space tabs in markdown
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

"join comment lines, numbered lists, etc
setlocal formatoptions+=rojn

setlocal comments=b:*,b:-,b:+,n:>

let b:did_md_ftplugin=1
