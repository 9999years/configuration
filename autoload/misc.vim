"get rid of whitespace at line ends
function misc#StripWhitespace(start, end)
	normal mx
	exe a:start . "," . a:end . " s/\\s\\+$//n"
	exe a:start . "," . a:end . " s/\\s\\+$//eg"
	noh
	normal `x
endfunction

function misc#HighlightNonASCII()
	normal! /[^\x0a\x09\x20-\x7e]
endfunction

function misc#UnsavedDiff()
	"create mark d, copy buffer and return to mark
	normal! mdgg"dyG`d
	"save syntax for later
	let l:syn=&syntax
	"turn diff on, new buffer, paste, refresh syntax
	diffthis
	vnew
	normal! "dpggdd
	let &syntax=l:syn
	diffthis
	set buftype=nofile
	set nobuflisted noswapfile readonly
	"switch windows, refresh content, switch back
	normal! p
	edit!
	normal! p
endfunction

"will this work in a tab with more than two windows? who knows!
function misc#UnsavedDiffOff()
	"set mark o to jump back to
	if expand("%") != ""
		normal! mop
	else
		normal! pmop
	endif
	"on the local (no filename) window now
	"copy unsaved changes
	normal! gg"dyG
	"get rid of buffer, delete/paste in new buffer, go back to mark o
	bwipe!
	lockmarks normal! gg"gdG"dpggdd`o
endfunction

function misc#EditFtplugin(...)
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "split " . g:VIMFILES . "/ftplugin/" . ft . ".vim"
endfunction

function misc#EditAfterFtplugin(...)
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "split " . g:VIMFILES . "/after/ftplugin/" . ft . ".vim"
endfunction

function misc#EditUltiSnips(...)
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "sp " . g:VIMFILES . "/plugged/vim-snippets/UltiSnips/" . ft . ".snippets"
endfunction

function misc#BuildCommandT(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!

  let l:ruby='ruby'

  if a:info.status != 'unchanged' || a:info.force
    if has('win32')
      !powershell ./make.ps1
    else
      exe '!sh -c "cd ruby/command-t/ext/command-t && ' . l:ruby . ' extconf.rb && make"'
    endif
  endif
endfunction

function misc#GetVimfiles()
  if has('win32')
    return expand("~/vimfiles")
  else
    return expand("~/.config/nvim")
  endif
endfunction

function misc#RelFile(filename)
  return g:VIMFILES . "/" . a:filename
endfunction

function misc#SourceRelative(filename)
  execute "source " . misc#RelFile(a:filename)
endfunction
