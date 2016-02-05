set nocompatible "ward off 'unexpected things'
set encoding=utf-8
set hidden "same window for multiple files
syntax on "syntax highlighting
filetype indent plugin on "determine lang from filename for indenting
set wildmenu "command line completion
set showcmd "show partial commands in last line
if $HOME ==? "C:\\Users\\xyz"
	set guifont=terminus:h12 "set font
elseif $HOME ==? "C:\\Users\\wxyz"
	set guifont=PragmataPro:h10
endif
set guioptions-=m	"remove menu bar
set guioptions-=T	"remove toolbar
set guioptions+=cr "console dialogs instead of popup dialogs
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
set autoindent "keep indent
set showcmd "show leader
"syntastic
let g:airline_section_error = 'syntastic'
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '‼'
let g:syntastic_warning_symbol = "⚠"
"When set to 3 the cursor will jump to the first error detected, if any. If
"all issues detected are warnings, the cursor won't jump. >
let g:syntastic_auto_jump = 3
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
"GitGutterSignsEnable
let g:gitgutterenabled = 1
let g:gitguttersigns = 1
"⋆≈❊╳⇠⍆≈⟡╬
"line to be deleted
"line to be deleted
"line to be changed
"line to be changed
"line to be added
"line to be added
"let g:gitgutter_sign_added = '╬'
"let g:gitgutter_sign_modified = '≈'
"let g:gitgutter_sign_removed = '╳'
"let g:gitgutter_sign_modified_removed = '≉'
set updatetime=750
let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_modified = '◇'
"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"airline
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
"airline symbols!
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  "let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  "let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

autocmd VimEnter * let &statusline='%{bufferline#refresh_status()}'.bufferline#get_status_string()
"set display += lastline "soft-wrap (dont cut lines that dont fit on screen)
"bind ctrl+bs to delete previous word
imap <C-BS> <C-W>
filetype on "indenting
filetype plugin on
filetype indent on
set list
set listchars=tab:\|\ ,trail:$ "show tabs as pipes and trailing spaces as $
"behave mswin
set lines=59 columns=120
colorscheme UBARYD "set colorscheme"
"automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
let filetype = fnamemodify(bufname("%"), ":e")
if filetype ==? "html" || filetype ==? "xml" || filetype ==? "php"
	let g:user_emmet_install_global = 0 "something for vim html
	autocmd FileType html,css EmmetInstall "same deal
	let g:user_emmet_expandabbr_key = '<c-e>'
	let g:use_emmet_complete_tag = 1
elseif filetype ==? "tex"
	let g:vimtex_view_general_viewer = "C:/Program Files/SumatraPDF/SumatraPDF.exe"
	map <f2> :w<cr><leader>ll
	vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
	vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
elseif filetype ==? "c"
	map <f2> :silent !make %:t:r.exe<cr>:silent !git commit -am "save/compile"<cr>
else
	map <f2> :w<cr>:silent !git commit -am "vim save %:t"<cr>
endif
