if exists('b:did_custom_help_ftplugin') | finish | endif
let b:did_custom_help_ftplugin = 1

" Use the built-in help instead of the coc one.
nnoremap <buffer> <silent> <F1> <ESC>:execute "help ".expand("<cword>")<CR>
" Use the built-in K instead of the coc one.
nnoremap <buffer> K K
