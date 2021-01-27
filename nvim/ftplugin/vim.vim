if exists("b:did_vim_ftplugin") | finish | endif
let b:did_vim_ftplugin = 1

setl foldmethod=marker foldlevel=0 shiftwidth=2 tabstop=2 expandtab

" Use the built-in help instead of the coc one.
nnoremap <buffer> <silent> <F1> <ESC>:execute "help ".expand("<cword>")<CR>
" Use the built-in K instead of the coc one.
nnoremap <buffer> K K
