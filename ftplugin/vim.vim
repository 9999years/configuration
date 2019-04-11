if exists("b:did_vim_ftplugin") | finish | endif
let b:did_vim_ftplugin = 1

setl sw=2
setl ts=2
setl expandtab

"CR on blank comment line deletes comment
imap <expr> <CR> getline('.') =~ '^\s*"\s\?$' ? '<C-u>' : '<CR>'
