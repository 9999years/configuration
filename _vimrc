set nocompatible "ward off 'unexpected things'
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
set novisualbell "no fucking beeping
set t_vb= "no fucking flashing either
set cmdheight=2 "2 line command window
set tabstop=4 "tabs are 4 chars
set shiftwidth=4 "how many cols of indent with >> and <<
set autoindent "keep indent
set showcmd "show leader
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
endif
