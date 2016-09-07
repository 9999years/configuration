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

"overwritten by airline i think but still cool
set wildmenu

"yeah this should be default too. wraps text
set wrap

"don't cut off the last line when it wont fit on the screen
set display+=lastline

"
set breakat=" 	!@*-+;:,./?="

"break at a character in breakat rather than last char on screen
set linebreak

"display tabs and trailing spaces
set list
set listchars=tab:\|\ ,trail:·,conceal:…,nbsp:␣

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

"tell nlcr and cp437 to fuck off in every file
"but also if it's read only don't complain when
"it doesn't work
"the ! is very important apparently
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufNew * silent! Normalize

"why not
nmap <Leader>n :Normalize<CR>

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
set shortmess=aoOsWA
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
"A: don't give the 'ATTENTION' message when an existing swap file
"is found.

"don't redraw while executing macros, etc
set lazyredraw

"let's keep it Chill howabout
set updatetime=750

"---CONCEAL---
set conceallevel=1

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
function! CycleYankRing()
	let @i=@"
	let @"=@k
	let @k=@j
	let @j=@i
	registers jk"
endfunction

"\s to cycle yank ring
nnoremap <Leader>s :call CycleYankRing()<CR>

"swap unnamed and system reg with \s
nnoremap <Leader>S :call SwapUnnamedAndSystem()<CR>

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

"---CONQUE TERM---
let g:ConqueTerm_PyVersion = 3

"---AIRLINE---
let g:airline#extensions#bufferline#enabled=0
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
let g:airline_symbols.branch='⎇'
let g:airline_left_sep='' "''
let g:airline_left_alt_sep='|' "''
let g:airline_right_sep='' "''
let g:airline_right_alt_sep='|' "''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''

let g:airline_section_error='syntastic'

"---SYNTASTIC---
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_warning_symbol='⍤' "○
let g:syntastic_style_error_symbol='⚡'

"When set to 3 the cursor will jump to the first error detected, if any. If
"all issues detected are warnings, the cursor won't jump.
let g:syntastic_auto_jump=3

"---AUTOSAVE---
"don't change updatetime
let g:auto_save_no_updatetime=1

"---GITGUTTER---
let g:gitgutterenabled=1
let g:gitguttersigns=1
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='≈'
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_modified_removed='≉'

"muscle memory
"this is unreliable
"make c-bs delete the current word
imap <C-BS> <C-W>

"i should probably change this at some point
colorscheme UBARYD

"dirty hack for a quick buffer list/switch
nmap <C-p> :ls<cr>:b 

"---FILETYPES---

"spellcheck for markdown and tex
au BufNewFile,BufRead *.md,*.tex setlocal spell

"oh christ, tex stuff
"wrap selection with $
au BufNewFile,BufRead *.tex vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
au BufNewFile,BufRead *.tex vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
au BufNewFile,BufRead *.tex imap <C-e> \textit{
au BufNewFile,BufRead *.tex imap <C-b> \textbf{
au BufNewFile,BufRead *.tex imap <C-s> \textsc{
"split lines in a semi-intelligent manner
"this sux don't use it
au BufNewFile,BufRead *.tex nmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
au BufNewFile,BufRead *.tex vmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
"silence that warning 38 (no punct. before quotes) bullshit
au BufNewFile,BufRead *.tex let g:syntastic_quiet_messages={
	\ "level": "warnings",
	\ "type": "style",
	\ "regex": "warning  38" }
"map <f2> :w<cr>:silent !git commit -am "vim save %:t"<cr>

au BufNewFile,BufRead *.md setf markdown

"map <f2> :w|silent !make %:t:r.exe|silent !git commit -am "save/compile"<CR>
"map <f2> :w<cr>:silent !git commit -am "vim save %:t"<cr>

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
