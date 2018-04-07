"this is my vimrc! hello!
"useful symbols:
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○✎
"all the arrows: https://pbs.twimg.com/media/CeKEybXWwAA2UkH.jpg:orig

"chill, represent chars as utf-8 internally
set encoding=utf-8
set nocompatible

"---VUNDLE---
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"show autocomplete menu w/o prompt
"Plugin 'vim-scripts/AutoComplPop'
"tab-completion
Plugin 'ervandew/supertab'
"better % matching
Plugin 'tmhedberg/matchit'
"better comment toggling
Plugin 'scrooloose/nerdcommenter'
"alignment
Plugin 'godlygeek/tabular'
"titlecasing commands
Plugin '9999years/vim-titlecase'
Plugin 'tpope/vim-unimpaired'

"snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"boilerplate insertion
Plugin '9999years/boilerplate-ultisnips'

"lang-specific
Plugin 'rust-lang/rust.vim'
Plugin 'cespare/vim-toml'
Plugin 'stephenway/postcss.vim'
"Plugin 'vim-scripts/Sass'

call vundle#end()
"figure out filetype from file
filetype indent plugin on

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

"visual command line completion
set wildmenu

set wildignore=
\.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,
\*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls

"yeah this should be default too. wraps text
set wrap

"no 2 spaces after . in gq
set joinspaces

"don't cut off the last line when it wont fit on the screen
set display+=lastline

set scrolloff=5

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

"---SEARCHING---

"ignore case while searching
set ignorecase

"unless the search contains caps
set smartcase

"highlight all matches of a search
set hlsearch

"jump to results as we find them
set incsearch

"map \cs to clear search
nnoremap <Leader>cs :let @/ = ""<CR>

"---INDENT---

"???
set cinoptions='(1s,M1'

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

"---CONCISENESS---
"keep stuff short and clean, in general

"help avoid hit-enter prompts
set shortmess=aoOsWAc

"don't redraw while executing macros, etc
set lazyredraw

"let's keep it Chill howabout
set updatetime=750

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

"muscle memory
"this is unreliable
"make c-bs delete the current word
imap <C-BS> <C-W>

"autocmd BufReadPre *.tex let b:did_indent = 1
let g:tex_flavor = 'latex'
"no spellchecking in tex comments
let g:tex_comment_nospell= 1

"---NERD---
let g:NERDAltDelims_fsharp = 1

"---ULTISNIPS---
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetsDir = expand('~/.vim/bundle/ultisnippets/')
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', g:UltiSnipsSnippetsDir]
