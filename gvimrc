if has('x11')
	set guifont=PragmataPro\ Mono\ Liga\ 12
elseif has('gui_macvim')
	set guifont=Menlo-Regular:h14
else
	set guifont=PragmataPro_Mono:h12:qANTIALIASED
endif
"ligatures: -> == =? // <> [ERROR]
set guioptions-=m "remove menu bar
set guioptions-=T "remove toolbar
set guioptions+=cr "console dialogs instead of popup dialogs
set lines=48 columns=85

"gghhghgh
hi NonText gui=NONE

"fix for box drawing line space
set linespace=0

if has('win32')
	"get dpi, strip out utf-16 chars and new lines
	"system() converts 0x00 to 0x01 for 'platform independence'
	"should return something like 'PixelsPerXLogicalInch=192'
	"get the part from the = to the end of the line (eg '=192') and strip
	"the first character
	"and convert to a number
	let g:dpi = str2nr(strpart(matchstr(substitute(
		\system('wmic desktopmonitor get PixelsPerXLogicalInch /value'),
		\'\%x01\|\%x0a\|\%x0a\|\%xff\|\%xfe', '', 'g'),
		\'=.*$'), 1))
	if dpi > 100
		set renderoptions=type:directx,renmode:0
		set guifont=PragmataPro_Mono:h11:qCLEARTYPE
	else
		"magic to make ligatures work
		set renderoptions=type:directx,renmode:1
	endif
endif

function! Present()
	let g:oldguifont=&gfn
	set guifont=PragmataPro_Mono:h18:qANTIALIASED
endfunction
command! -nargs=0 Present call Present()

function! Unpresent()
	let &guifont=g:oldguifont
endfunction
command! -nargs=0 Unpresent call Unpresent()
