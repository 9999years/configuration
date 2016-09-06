"tell nlcr to fuck off
set ff=unix

"tell cp437 to fuck off
set encoding=utf-8

"don't just abandon buffers when i switch buffers
set hidden

"i hope this does what i imagine it does
set autowrite

"visual command line completion
set wildmenu

"show commands in the bottom right as i enter them
set showcmd

"ignore case while searching
set ignorecase

"unless the search contains caps
set smartcase

"highlight all matches of a search
set hlsearch

"make backspacing work the way it should
set backspace=indent,eol,start

"show line numbers jesus christ why isn't this on by default
set number

"show cursor position
set ruler

"display status line
set laststatus=2

"instead of failing a command show a confirm dialogue
set confirm

"no visual bell
set vb t_vb=

"2-line high command window to prevent many PRESS ENTER TO CONTINUE dialogues
set cmdheight=2

"---INDENT---
"tabs
set tabstop=8
set shiftwidth=8

"keep indent when i create a new line
set autoindent

"use C-t and C-d in i-mode to round the indent to a multiple of shiftwidth
set shiftround

"figure out filetype from file
filetype indent plugin on

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

"overwritten by airline i think but still cool
set wildmenu

"yeah this should be default too. wraps text
set wrap

"don't cut off the last line when it wont fit on the screen
set display+=lastline

"break at a character in breakat rather than last char on screen
set linebreak

"display tabs and trailing spaces
set list
set listchars=tab:\|\ ,trail:·,conceal:…,nbsp:␣

"let's keep it Chill howabout
"helps with gitgutter and power consumption
set updatetime=750

"i end up using this a lot ok
let $PROFILE="~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"

"syntax highlighting
syntax on

"make j and k operate on screen lines.
"text selection still operates on file lines.
"this might cause problems with macros, idk
"actually this whole thing is not confirmed to work
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

"let &showbreak="↪ "
"set cpo=n
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○

"---CONCEAL---
set conceallevel=1

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
