set nocompatible "ward off 'unexpected things'
set hidden "same window for multiple files
syntax on "syntax highlighting
filetype indent plugin on "determine lang from filename for indenting
set wildmenu "command line completion
set showcmd "show partial commands in last line
set guifont=terminus:h12 "set font
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
set visualbell "no fucking beeping
set t_vb= "no fucking flashing either
set cmdheight=2 "2 line command window
set tabstop=4 "tabs are 4 chars
set shiftwidth=4 "how many cols of indent with >> and <<
set autoindent
filetype on
filetype plugin on
filetype indent on
set list
set listchars=tab:\|\ ,trail:$ "show tabs as pipes and trailing spaces as $
behave mswin
set lines=59 columns=120
colorscheme UBARYD "set colorscheme"
let filetype = fnamemodify(bufname("%"), ":e")
if filetype ==? "html"
	let g:user_emmet_install_global = 0 "something for vim html
	autocmd FileType html,css EmmetInstall "same deal
	let g:user_emmet_expandabbr_key = '<c-e>'
	let g:use_emmet_complete_tag = 1
endif
