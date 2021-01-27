"Only do this when not done yet for this buffer
if exists("b:did_fsharp_ftplugin")
	finish
endif
let b:did_fsharp_ftplugin = 1

" spaces for indents
setl tabstop=4
setl shiftwidth=4
setl expandtab
