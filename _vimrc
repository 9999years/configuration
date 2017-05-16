"this is my vimrc! hello!
"useful symbols:
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○✎
"all the arrows: https://pbs.twimg.com/media/CeKEybXWwAA2UkH.jpg:orig

"chill, represent chars as utf-8 internally
set encoding=utf-8

"---MISC---
"mostly things that should probably be default in the first place

"show line numbers jesus christ why isn't this on by default
"seriously what the fuck. even if im in an 80x24 terminal i want this shit.
"christ
set number

"syntax highlighting
syntax on

"show cursor position
set ruler

"no visual bell
set vb t_vb=

"don't just abandon buffers when i switch buffers
set hidden

"make backspacing work the way it should
set backspace=indent,eol,start

"figure out filetype from file
filetype indent plugin on

"visual command line completion
set wildmenu

set wildignore=
\.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,
\*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls

"yeah this should be default too. wraps text
set wrap

"don't cut off the last line when it wont fit on the screen
set display+=lastline

"
let &breakat=" 	!@*-+;:,./?="

"break at a character in breakat rather than last char on screen
set linebreak

"display tabs and trailing spaces
set list
set listchars=tab:│\ ,trail:·,extends:…,nbsp:␣,conceal:
set fillchars=vert:║,fold:═,diff:
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○✎‖

"instead of giving a ridiculous error just ask are you sure?
"if i :q when i meant :q!
set confirm

"i end up using this a lot ok
let $PROFILE="~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"

"make the diff windows make sense
set splitright

"make j and k operate on screen lines.
"text selection still operates on file lines.
"this might cause problems with macros, idk
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"muscle memory
"this is unreliable
"why is this unreliable? shouldn't vim just intercept the keystrokes?
"make c-bs delete the current word
imap <C-BS> <C-W>

"dirty hack for a quick buffer list/switch
"sorry Ctrl-P users
nmap <C-p> :ls<cr>:b

"join comments, make numbered lists (!!) work
set formatoptions+=jnroc
set formatlistpat=^\s*\d\+[\]:.)}]\s*

"---COMMAND LINE---
"also other stuff in the bottom few lines of the screen

"visual command line completion
set wildmenu

"display status line
set laststatus=2

"show commands in the bottom right as i enter them
set showcmd

"2-line high command window to prevent many PRESS ENTER TO CONTINUE dialogues
set cmdheight=2

"set cpo=n

"---SEARCHING---

"ignore case while searching
set ignorecase

"unless the search contains caps
set smartcase

"highlight all matches of a search
set hlsearch

"map \s to clear search
nnoremap <Leader>ss :let @/ = ""<CR>

"and \n to clear highlight
nnoremap <Leader>n :noh<CR>

"---UNICODE---
"i made these bindings and i am extremely proud of them

"make \u insert the unicode point of the char under the cursor in nl above
nmap <Leader>p mf"fylo<C-r>=printf('U+%x', char2nr(@f))<CR><ESC>:call NERDComment(0, 'norm')<CR>`f

"make \U insert the unicode point of the char under the cursor in nl below
nmap <Leader>P mf"fylO<C-r>=printf('U+%x', char2nr(@f))<CR><ESC>:call NERDComment(0, 'norm')<CR>`f

"\f prints char literal's codepoint inline in a parenthetical
"commented out for now, not sure what ill do with this
"nmap <Leader>f "fyla (<C-r>=printf('U+%x', char2nr(@f))<CR>) <ESC>

"\f replaces char under cursor with codepoint
nmap <Leader>f "fcl<C-r>=printf('%x', char2nr(@f))<CR><ESC>

"\F converts codepoint under cursor to char literal
nmap <Leader>F "fyawea <C-r>=nr2char('0x' . @f)<CR><ESC>

"simple function to fix crlf and weird encodings
function! NormalizeCurrentFile()
	set fileformat=unix
	set fileencoding=utf-8
endfunction

command! -nargs=0 Normalize call NormalizeCurrentFile()

function! Base64Encode() range
	" go to first line, last line, delete into @b, insert text note the
	" substitute() call to join the b64 into one line this lets
	" `:Base64Encode | Base64Decode` work without modifying the text at
	" all, regardless of line length -- although that particular command
	" is useless, lossless editing is a plus
	exe "normal! " . a:firstline . "GV" . a:lastline . "G"
	\ . "\"bdO0\<C-d>\<C-r>\<C-o>"
	\ . "=substitute(system('python -m base64 -e', @b), "
	\ . "'\\n', '', 'g')\<CR>\<ESC>"
endfunction

function! Base64Decode() range
	let l:join = "\"bc"
	if a:firstline != a:lastline
		" gJ exits vis mode so we need a cc to change two lines
		let l:join = "gJ" . l:join . "c"
	endif
	exe "normal! " . a:firstline . "GV" . a:lastline . "G" . l:join
	\ . "0\<C-d>\<C-r>\<C-o>"
	\ . "=system('python -m base64 -d', @b)\<CR>\<BS>\<ESC>"
endfunction

command! -nargs=0 -range -bar Base64Encode <line1>,<line2>call Base64Encode()
command! -nargs=0 -range -bar Base64Decode <line1>,<line2>call Base64Decode()

"tell nlcr and cp437 to fuck off in every file
"but also if it's read only don't complain when
"it doesn't work
"the ! is very important apparently
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufNew * silent! Normalize

"---INDENT---

"tabs are 8 characters wide
set tabstop=8
set shiftwidth=8

"keep indent when i create a new line
set autoindent

"use C-t and C-d in i-mode to round the indent to a multiple of shiftwidth
set shiftround

"preserve indent when wrapping lines
set breakindent

"show a cool arrow to indicate that's what happened
let &showbreak="↪ "

"minimum 30col text and shift it back -2 so that it isn't pushed forward by
"the arrow
let &breakindentopt='min:30,shift:-2'

"get rid of whitespace at line ends
function! StripWhitespace()
	normal mx
	%s/\s*$//g
	noh
	normal `x
endfunction

set cinoptions='(1s,M1'

command! -nargs=0 StripWhitespace call StripWhitespace()

"---BACKUP---
"saying this is broken would imply it worked in the first place
"which it didn't

"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

"---CONCISENESS---
"keep stuff short and clean, in general

"help avoid hit-enter prompts
set shortmess=aoOsWAc
"f: use '(3 of 5)' instead of '(file 3 of 5)'
"i: use '[noeol]' instead of '[Incomplete last line]'
"l: use '999L, 888C' instead of '999 lines, 888 characters'
"m: use '[+]' instead of '[Modified]'
"n: use '[New]' instead of '[New File]'
"r: use '[RO]' instead of '[readonly]'
"w: use '[w]' instead of 'written' for file write message and '[a]' instead of 'appended' for ':w >> file' command
"x: use '[dos]' instead of '[dos format]', '[unix]' instead of '[unix format]' and '[mac]' instead of '[mac format]'.
"a: all of the above abbreviations

"o: overwrite message for writing a file with subsequent message
"for reading a file (useful for ':wn' or when 'autowrite' on)
"O: message for reading a file overwrites any previous message.
"Also for quickfix message (e.g., ':cn').
"s: don't give 'search hit BOTTOM, continuing at TOP' or 'search
"hit TOP, continuing at BOTTOM' messages
"on the command-line, '<' will appear in the left most column.
"Ignored in Ex mode.
"W: don't give 'written' or '[w]' when writing a file
"A: don't give the 'ATTENTION' message when an existing swap file is found.
"c: no completion messages

"don't redraw while executing macros, etc
set lazyredraw

"let's keep it Chill howabout
set updatetime=750

"---CONCEAL---
"set conceallevel=1

"---REGISTERS---
"
"swap system and unnamed reg
function! SwapUnnamedAndSystem()
	let @h=@"
	let @"=@*
	let @*=@h
	registers *"
endfunction

"give three registers, jk and ", cycle between them
"function! CycleYankRing()
	"let @i=@"
	"let @"=@k
	"let @k=@j
	"let @j=@i
	"registers jk"
"endfunction

"\s to cycle yank ring
"nnoremap <Leader>s :call CycleYankRing()<CR>

"swap unnamed and system reg with \s
"nnoremap <Leader>S :call SwapUnnamedAndSystem()<CR>

"---PRINT INTERNAL COMMANDS---
"useful with:
"ga/:ascii, g8, :=, :Print, :changes, :history, jumps, :list, :pwd,
":py, :py3, :version, i_<C-g>, g<, :display/:registers, :messages
":echo getfsize(expand(@%)), printing the stuff in :h function-list
"without using I<C-r>=...

function! PrintInternal (command)
	normal mx
	redir @x
	let l:len = strlen(a:command)
	if(a:command[0] == ':')
		"execute the command after :, eg
		":registers
		silent! execute a:command[1 : len]
	elseif(a:command[0] == '=')
		"evaluate the expression after =, eg
		"=0xffff
		"or
		"=localtime()
		silent! echo eval(a:command[1 : len])
	else
		"execute the command in normal mode, eg
		"ga
		silent! execute 'normal ' . a:command
	endif
	redir END
	normal $"xp`x

endfunction

command! -nargs=1 -complete=command Internal call PrintInternal(<q-args>)
nmap <Leader>a :call PrintInternal(input('✎⮤', '', 'command'))<CR>

"---MISC---
"mappings?
command! -nargs=0 PrintHighlightGroups so $VIMRUNTIME/syntax/hitest.vim

"\z and c-z insert best guess for spell checking
nnoremap <Leader>z 1z=
inoremap <C-z> <ESC>1z=ea

function! NoDistractions()
	setlocal nolist
	setlocal laststatus=0
	setlocal rulerformat=%{wordcount().words}
	setlocal nonumber
	setlocal cmdheight=1
	inoremap <buffer> <C-s> <C-\><C-o>:w<CR>
endfunction

command! -nargs=0 NoDistractions call NoDistractions()

function! UnsavedDiff()
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
function! UnsavedDiffOff()
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

command! -nargs=0 UnsavedDiffOff call UnsavedDiffOff()
command! -nargs=0 UnsavedDiff call UnsavedDiff()

"load netrw if we open vim with no files
"augroup VimStartup
	"au!
	"au VimEnter * if expand("%") == "" | e . | endif
"augroup END

"---AIRLINE---
function! AirlineInit()
	let g:airline#extensions#bufferline#enabled=0
	let g:airline#extensions#syntastic#enabled=0
	let g:airline#extensions#whitespace#enabled=0
	let g:airline#extensions#wordcount#enabled=1
	let g:airline#extensions#wordcount#filetypes =
	\ 'markdown|rst|org|help|text'
	"let g:airline_section_error = airline#section#create(['branch'])
	let g:airline_section_a     = '%{substitute(mode(), "CTRL-", "^", "g")}'
	let g:airline_section_b     = airline#section#create(['ffenc'])
	let g:airline_section_error = airline#section#create(['syntastic'])
	"see 'statusline'
	let g:airline_section_c     = '%{expand(''%:h:t'')}/%t %m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
	let g:airline_section_gutter = '%='
	let g:airline_section_warning = ''
	"let g:airline_section_x = '%{airline#util#wrap(airline#parts#filetype(),0)}'
	let g:airline_section_x = '%{&ft}'
	let g:airline_section_y = ''
	let g:airline_section_z = '%3p%% %{g:airline_symbols.linenr}%4l:%3v'

	if !exists('g:airline_symbols')
		let g:airline_symbols={}
	endif
	let g:airline_symbols.branch='⎇'
	let g:airline_left_sep='' "''
	let g:airline_left_alt_sep='│' "''
	let g:airline_right_sep='' "''
	let g:airline_right_alt_sep='│' "''
	let g:airline_symbols.readonly=''
	let g:airline_symbols.linenr=''
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"---SYNTASTIC---
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='⍤' "○
let g:syntastic_style_error_symbol='⚡'

"dont fuck w my cursor
let g:syntastic_auto_jump=0

"use \sk and \sj to navigate errors
nmap <Leader>sk :lprevious<CR>
nmap <Leader>sj :lnext<CR>

"---AUTOSAVE---
"don't change updatetime
"i dont even think i still have this
let g:auto_save_no_updatetime=1

"muscle memory
"this is unreliable
"make c-bs delete the current word
imap <C-BS> <C-W>

"---FILETYPES---
"md is for markdown
autocmd BufNewFile,BufRead *.md setfiletype markdown
autocmd BufEnter *.mac let b:syntastic_checkers = [] | setfiletype maxima | SyntasticReset

"autocmd BufReadPre *.tex let b:did_indent = 1
let g:tex_flavor = 'latex'
"no spellchecking in tex comments
let g:tex_comment_nospell= 1
"no syntax
let g:syntastic_tex_checkers = []

"---KISS---
command! -nargs=? InsertBoilerplate KISSInsertBoilerplate <args>
command! -nargs=? IBoilerplate KISSInsertBoilerplate <args>
command! -nargs=1 EditBoilerplate KISSEditBoilerplate <args>
command! -nargs=1 EBoilerplate KISSEditBoilerplate <args>
let g:kiss_boilerplate_synonyms = {
	\ 'cc': 'c',
	\ 'plaintex': 'tex',
	\ 'expat': 'mit',
	\ 'mit/expat': 'mit',
	\ 'pgf': 'pgfplots',
	\ 'cpp': 'c',
	\ 'c++': 'c',
	\ 'bounce': 'dir'
	\ }

"---COMPLETIONS---
set completeopt=menu,menuone,longest
set pumheight=10
let g:SuperTabDefaultCompletionType = 'context'
let g:acp_autoselectFirstCompletion = 0

"---GUI---
"sometimes re-sourcing the vimrc messes up the colorscheme
"so just resource the gvimrc if we source the vimrc

"autocmd GUIEnter * source $MYGVIMRC
if(has("gui_running"))
	if($MYGVIMRC == '')
		let $MYGVIMRC = $VIM . '\_gvimrc'
	endif
	source $MYGVIMRC
endif
