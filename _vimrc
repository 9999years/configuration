set nocompatible "ward off 'unexpected things'
set ff=unix
set encoding=utf-8
set hidden "same window for multiple files
set wildmenu "command line completion
set showcmd "show partial commands in last line
set ignorecase "ignore case while searching
set smartcase " ...unless search is all caps
set hlsearch "highlight searches
set backspace=indent,eol,start "allow backspacing over indent,linebreaks,start of insert action
set number "show line numbers
set ruler "display cursor position
set laststatus=2 "display status line
set confirm "instead of failing cmd raise a confirm daialogue
set vb t_vb= "no fucking flashing either
set cmdheight=2 "2 line command window
set tabstop=4 "tabs are 4 chars
set shiftwidth=4 "how many cols of indent with >> and <<
set shiftround
set shortmess=lmnrwxoOsA
"just :help that if you ever need to understand it
set autoindent "keep indent
set showcmd "show leader
set wrap
set list
set listchars=tab:\|\ ,trail:·
set updatetime=750
let $PROFILE="~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
syntax on "syntax highlighting
filetype indent plugin on "determine lang from filename for indenting
"let &showbreak="↪ "
"set cpo=n
"ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
set display+=lastline "soft-wrap (dont cut lines that dont fit on screen)
"airline stuff↪⋱↳
let g:airline#extensions#bufferline#enabled=0
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#whitespace#enabled=0
"let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep=''
"let g:airline#extensions#tabline#left_alt_sep=''
"syntastic
let g:airline_section_error='syntastic'
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol="⚠"
let g:syntastic_style_warning_symbol="○"
let g:syntastic_style_error_symbol="⚡"
"When set to 3 the cursor will jump to the first error detected, if any. If
"all issues detected are warnings, the cursor won't jump. >
let g:syntastic_auto_jump=3
let g:auto_save_no_updatetime=1  " do not change the 'updatetime' option
"GitGutterSignsEnable
let g:gitgutterenabled=1
let g:gitguttersigns=1
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪⋱○
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='≈'
let g:gitgutter_sign_removed=''
let g:gitgutter_sign_modified_removed='≉'
"airline symbols!
if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif
" unicode symbols
let g:airline_symbols.branch='⎇'
let g:airline_left_sep='' "''
let g:airline_left_alt_sep='|' "''
let g:airline_right_sep='' "''
let g:airline_right_alt_sep='|' "''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''
"set display += lastline "soft-wrap (dont cut lines that dont fit on screen)
"bind ctrl+bs to delete previous word
imap <C-BS> <C-W>
colorscheme UBARYD
"automatically cd into the directory that the file is in
"autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"hack
nmap <C-p> :ls<cr>:b 
if &ft ==? "tex"
	set spell
	map <f2> :w<cr><leader>ll
	vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
	vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
	imap <C-e> \textit{
	imap <C-b> \textbf{
	imap <C-s> \textsc{
	nmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
	vmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
	"silence that warning 38 (no punct. before quotes) bullshit
	let g:syntastic_quiet_messages={
		\ "level": "warnings",
		\ "type": "style",
		\ "regex": "warning  38" }
elseif &ft ==? "c"
	"map <f2> :w|silent !make %:t:r.exe|silent !git commit -am "save/compile"<CR>
else
	map <f2> :w<cr>:silent !git commit -am "vim save %:t"<cr>
endif
noh
