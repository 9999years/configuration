" kiss-boilerplate.vim:  (global plugin) easy boilerplate insertion
" Last Change:           idk check the commit logs
" Maintainer:            rebecca turner
" Version:               1.0.1, for Vim 6.3+
" URL:                   https//github.com/9999years/boiler.vim

" Documentation:
" just call InsertBoilerplate, use an argument to override filetype
" KISS: keep it stupendously simple

if exists('loaded_boilervim')
	finish
endif
let loaded_boilervim = 1

function InsertBoilerplate(...)
	"current directory, up 1 and get the boilerplate dir
	let s:file = expand('<sfile>:p:h') . '/../boilerplate/boiler.'
	"defer to arguments over filetype option if possible, append to ext
	if a:0 > 0
		let s:file .= a:1
	else
		let s:file .= &filetype
	endif
	silent! execute '0read ' . fnameescape(s:file)
	normal Gddgg
endfunction

command -nargs=? InsertBoilerplate :call InsertBoilerplate(<args>)

autocmd BufNewFile * InsertBoilerplate
