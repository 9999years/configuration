"  kiss-boiler.vim:  (global plugin) easy boilerplate insertion
"  Last Change:      idk check the commit logs
"  Maintainer:       rebecca turner
"  Version:          0.0.1, for Vim 6.3+
"  URL:              github probably

" Documentation:
" just call InsertBoilerplate, use an argument to override filetype
" KISS

if exists("loaded_boilervim")
	finish
endif
let loaded_boilervim = 1

function InsertBoilerplate(...)
	"current directory, up 1 and get the boilerplate dir
	let s:file = expand('<sfile>:p:h') . "../boilerplate/boiler."
	"defer to arguments
	if a:0 > 0
		let s:file .= a:1
	else
		let s:file .= &filetype
	endif
	append(line('.'), 'eiarsntoareinst')
	silent! execute "0read " . fnameescape(s:file)
	normal Gddgg
	"if /{{EDIT}}
		"normal dd
	"endif
endfunction

command -nargs=? InsertBoilerplate :call InsertBoilerplate(<args>)

autocmd BufNewFile * InsertBoilerplate
