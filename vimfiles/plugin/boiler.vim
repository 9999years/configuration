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

let s:MSWIN = has("win16") || has("win32")   || has("win64")    || has("win95")
let s:UNIX  = has("unix")  || has("macunix") || has("win32unix")

if s:MSWIN
	let s:cat = "type"
elseif s:UNIX
	let s:cat = "cat"
endif

function InsertBoilerplate(...)
	let s:file = "$VIM/vimfiles/boilerplate/boiler."
	"defer to arguments
	if a:0 > 0
		let s:file .= a:1
	else
		let s:file .= &filetype
	endif
	silent! execute "0read " . fnameescape(s:file)
endfunction

nmap <Leader>i :call InsertBoilerplate()<CR>
