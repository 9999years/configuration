if exists("b:did_vim_ftplugin") | finish | endif
let b:did_vim_ftplugin = 1

"CR on blank comment line deletes comment
imap <expr> <CR> getline('.') =~ '^\s*"\s\?$' ? '<C-u>' : '<CR>'

"if filename is ~/foo/Bar.fs, this is Bar
let b:class_name = expand('%:t:r')

if stridx(expand('%'), 'ftplugin') > -1
	let b:ftplugin_varname = "b:did_" . b:class_name . "_ftplugin"
	let b:ftplugin_boilerplate = "if exists(\"" . b:ftplugin_varname
		\ . "\") | finish | endif\nlet " . b:ftplugin_varname . " = 1"
	"if the buffer is empty
	if line('$') == 1 && getline(1) == ''
		"put in our boilerplate
		exe "normal! \"=b:ftplugin_boilerplate\<CR>p"
	endif
endif
