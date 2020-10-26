if exists('g:did_filetypes_aucmds') | finish | endif
let g:did_filetypes_aucmds = 1

autocmd BufRead *.cls set filetype=tex
So ../ftdetect/justfile.vim
