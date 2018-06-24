"this is my vimrc! hello!
"useful symbols:
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○✎
"all the arrows: https://pbs.twimg.com/media/CeKEybXWwAA2UkH.jpg:orig

"chill, represent chars as utf-8 internally
set encoding=utf-8
set nocompatible

"---VIM-PLUG---
call plug#begin()

Plug 'VundleVim/Vundle.vim'

Plug 'vim-airline/vim-airline' "status line
Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-scripts/AutoComplPop' "show autocomplete menu w/o prompt
Plug 'ervandew/supertab'        " tab-completion
Plug 'tmhedberg/matchit'        " better % matching
Plug 'scrooloose/nerdcommenter' " better comment toggling
Plug 'godlygeek/tabular'        " alignment
Plug '9999years/vim-titlecase'  " titlecasing commands
Plug 'tpope/vim-unimpaired'

Plug 'SirVer/ultisnips' " snippets!
Plug 'honza/vim-snippets'
Plug '9999years/snips'
Plug '9999years/boilerplate-ultisnips' "boilerplate insertion

"lang-specific plugins
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'stephenway/postcss.vim'
"Plug 'vim-scripts/Sass'
Plug 'isobit/vim-caddyfile'

call plug#end()

"figure out filetype from file
filetype indent plugin on

"---MISC---
"mostly things that should probably be default in the first place

"show line numbers jesus christ why isn't this on by default
"seriously what the fuck. even if im in an 80x24 terminal i want this shit.
"christ
set number
syntax on                      " syntax highlighting
set ruler                      " show cursor position
set vb t_vb=                   " no visual bell
set hidden                     " don't just abandon buffers when i switch buffers
set backspace=indent,eol,start " make backspacing work the way it should
set wildmenu                   " visual command line completion
set wildignore=
\.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,
\*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls
set wrap              " yeah this should be default too. wraps text
set display+=lastline " don't cut off the last line when it wont fit on the screen
set scrolloff=0
let &breakat=" 	!@*-+;:,./?="
set linebreak " break at a character in breakat rather than last char on screen
set list      " display tabs and trailing spaces
set listchars=tab:│\ ,trail:·,extends:…,nbsp:␣,conceal:
set fillchars=vert:║,fold:═,diff:
set splitright "make the diff windows make sense

"instead of giving a ridiculous error just ask are you sure?
"if i :q when i meant :q!
set confirm

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
"no 2 spaces after . when gq
set nojoinspaces

"---COMMAND LINE---
"also other stuff in the bottom few lines of the screen

set wildmenu     " visual command line completion
set laststatus=2 " display status line
set showcmd      " show commands in the bottom right as i enter them
set cmdheight=2  " 2-row cmd-window; avoids PRESS ENTER TO CONTINUE

"---SEARCHING---

set ignorecase " ignore case while searching
set smartcase  " unless the search contains caps
set hlsearch   " highlight all matches of a search
set incsearch  " jump to results as we find them
"map \cs to clear search
nnoremap <Leader>cs :let @/ = ""<CR>

"---INDENT---

set cinoptions='(1s,M1' " read the docs yourself lol
set tabstop=8 "tabs are 8 characters wide
set shiftwidth=8
set autoindent "keep indent when i create a new line
set shiftround "use C-t and C-d in i-mode to round the indent to a multiple of shiftwidth
set breakindent "preserve indent when wrapping lines
" make wrapped lines at least 30 columns wide, and offset -2 columns to
" account for the cool arrow on the next line
let &breakindentopt='min:30,shift:-2'
let &showbreak="↪ " " show a cool arrow to indicate that's what happened

"---CONCISENESS---
"keep stuff short and clean, in general

set shortmess=aoOsWAc "help avoid hit-enter prompts
set lazyredraw "don't redraw while executing macros, etc
set updatetime=750 "let's keep it Chill howabout

"---COMPLETIONS---
set completeopt=menu,menuone,longest
set pumheight=10
"let g:SuperTabDefaultCompletionType = 'context'
"let g:acp_autoselectFirstCompletion = 0
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---MISC---

"i end up using this a lot ok
let $PROFILE="~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"

"---UNICODE---
"i made these bindings and i am extremely proud of them

"make \u insert the unicode point of the char under the cursor in nl above
nmap <Leader>p mf"fylo<C-r>=printf('U+%x', char2nr(@f))<CR><ESC>:call NERDComment(0, 'norm')<CR>`f

"\f replaces char under cursor with codepoint
nmap <Leader>f "fcl<C-r>=printf('%x', char2nr(@f))<CR><ESC>

"\F converts codepoint under cursor to char literal
nmap <Leader>F "fyawea <C-r>=nr2char('0x' . @f)<CR><ESC>

"simple function to fix crlf and weird encodings
function! NormalizeCurrentFile()
	set fileformat=unix
	set fileencoding=utf-8
endfunction

"but also if it's read only don't complain when
"it doesn't work
"the ! is very important apparently
autocmd BufNewFile,BufRead,BufAdd,BufCreate,BufNew * silent! call NormalizeCurrentFile()

"get rid of whitespace at line ends
function! StripWhitespace()
	normal mx
	%s/\s*$//g
	noh
	normal `x
endfunction

command! -nargs=0 StripWhitespace call StripWhitespace()

"\z and c-z insert best guess for spell checking
nnoremap <Leader>z 1z=
inoremap <C-z> <ESC>1z=ea


function! HighlightNonASCII()
	normal! /[^\x0a\x09\x20-\x7e]
endfunction
command! -nargs=0 HighlightNonASCII call HighlightNonASCII()

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
	"let g:airline_section_error = airline#section#create(['syntastic'])
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

"autocmd BufReadPre *.tex let b:did_indent = 1
let g:tex_flavor = 'latex'
"no spellchecking in tex comments
let g:tex_comment_nospell= 1

"---NERD---
let g:NERDAltDelims_fsharp = 1

"---ULTISNIPS---
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'plugged/snips']
