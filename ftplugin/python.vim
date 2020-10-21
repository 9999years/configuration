if exists('b:loaded_custom_python_ftplugin') | finish | end
let b:loaded_custom_python_ftplugin=1

" autocmd BufWritePre <buffer> CocCommand python.sortImports

"<CR> on line with only # deletes comment
imap <expr> <CR> getline('.') =~ '^\s*#\s*$' ? '<C-u>' : '<CR>'

"<ESC> on line with only # deletes comment
imap <expr> <ESC> getline('.') =~ '^\s*#\s*$' ? '<C-u><ESC>' : '<ESC>'
