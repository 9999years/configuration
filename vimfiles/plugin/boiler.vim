"  boiler.vim:   (global plugin) easy boilerplate insertion
"  Last Change:  idk check the commit logs
"  Maintainer:   rebecca turner
"  Version:      0.0.1, for Vim 6.3+
"  URL:          github probably

" Documentation:
" just call InsertBoilerplate, use an argument to override filetype
" KISS

if exists("loaded_boilervim") || &cp
	finish
endif
let loaded_boilervim = 1

function InsertBoilerplate(...)
	let s:file = "$VIM/vimfiles/boilerplate/boiler."
	"defer to arguments
	if a:0 > 0
		let s:file .= a:1
	else
		let s:file .= &filetype
	endif
	silent! execute "0read " . fnameescape(s:file)
	normal Gddgg
	if /{{EDIT}}
		normal dd
	endif
endfunction

command -nargs=? InsertBoilerplate :call InsertBoilerplate(<args>)

nmap <Leader>i :InsertBoilerplate<CR>

autocmd BufNewFile * InsertBoilerplate
