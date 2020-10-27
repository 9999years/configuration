" Delete all end-of-line whitespace in the current buffer.
function misc#StripWhitespace(start, end) abort
  "
  let l:cursor = getcurpos()
  " Display number of matches.
  exe a:start . "," . a:end . " smagic/\\s\\+$//n"
  " Do not error if no matches.
  keepjumps exe a:start . "," . a:end . " smagic/\\s\\+$//eg"
  nohlsearch
  call setpos('.', l:cursor)
endfunction

function misc#HighlightNonASCII()
	normal! /[^\x0a\x09\x20-\x7e]
endfunction

function misc#EditFtplugin(...) abort
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "split " . stdpath("config") . "/ftplugin/" . ft . ".vim"
endfunction

function misc#EditAfterFtplugin(...) abort
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "split " . stdpath("config") . "/after/ftplugin/" . ft . ".vim"
endfunction

function misc#EditUltiSnips(...) abort
	if a:0 == 0
		let ft = &ft
	else
		let ft = a:1
	endif
	exe "sp " . stdpath("config") . "/plugged/vim-snippets/UltiSnips/" . ft . ".snippets"
endfunction

function misc#BuildCommandT(info) abort
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

" Start-of-vimrc initialization
"
" Tracks sourced scripts in s:sourcefname to enable relative imports.
function misc#begin() abort
  augroup misc_rbt
    autocmd!
    autocmd SourcePre * call misc#SourcePre()
    autocmd SourcePost * call misc#SourcePost()
  augroup end
  command -nargs=1 So call misc#SourceRel(<f-args>)
  let s:sourcefname = [fnamemodify($MYVIMRC, ':p:h')]
endfunction

" End-of-vimrc cleanup
function misc#end() abort
  autocmd! misc_rbt
  delcommand So
endfunction

function misc#SourcePre() abort
  call add(s:sourcefname, expand('<afile>:p:h'))
endfunction

function misc#SourcePost() abort
  call remove(s:sourcefname, -1)
endfunction

function misc#SourceRel(filename) abort
  exe "source " . s:sourcefname[-1] . "/" . a:filename
endfunction
