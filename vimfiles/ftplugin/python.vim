if exists('loaded_pythonftplugin')
	finish
endif
let loaded_pythonftplugin=1

"<CR> on line with only # deletes comment
imap <expr> <CR> getline('.') =~ '^\s*#\s*$' ? '<C-u>' : '<CR>'

"<ESC> on line with only # deletes comment
imap <expr> <ESC> getline('.') =~ '^\s*#\s*$' ? '<C-u><ESC>' : '<ESC>'
