if exists('g:did_basic_options') | finish | endif
let g:did_basic_options = 1

"mostly things that should probably be default in the first place
if !has('nvim')
  set nocompatible
  filetype indent plugin on      "figure out filetype from file
  syntax on                      " syntax highlighting
endif
"show line numbers jesus christ why isn't this on by default
"seriously what the fuck. even if im in an 80x24 terminal i want this shit.
"christ
set number
set ruler                      " show cursor position
set vb t_vb=                   " no visual bell
set hidden                     " don't just abandon buffers when i switch buffers
set backspace=indent,eol,start " make backspacing work the way it should
set wildmenu                   " visual command line completion
set wildignore=
\.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,
\*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls,*.hi,*.lock,*.aux,*.fdb_latexmk,
\*.synctex.*
set wrap              " yeah this should be default too. wraps text
set display+=lastline " don't cut off the last line when it wont fit on the screen
set scrolloff=0
let &breakat=" !@*-+;:,./?="
set linebreak " break at a character in breakat rather than last char on screen
set list      " display tabs and trailing spaces
set listchars=tab:│\ ,trail:·,extends:…,nbsp:␣
set fillchars=vert:║,fold:═,diff:·
if has('macunix')
  set fillchars=vert:║,fold:═,diff:☓
end
set splitright "make the diff windows make sense
set conceallevel=2

"instead of giving a ridiculous error just ask are you sure?
"if i :q when i meant :q!
set confirm

if has('macunix') && exists('&rubydll')
  set rubydll=/usr/local/opt/ruby/lib/libruby.dylib
end

if has('termguicolors')
  set termguicolors
end

if !exists('g:loaded_colorscheme')
  let g:loaded_colorscheme = 1
  "silent! colorscheme Tomorrow-Night-Bright
  "silent! colorscheme nord
  "silent! colorscheme ubaryd

  " See: ../colors/molokai_dark_paren_fix.vim
  silent! colorscheme molokai_dark_paren_fix
endif

"join comments, make numbered lists (!!) work
set formatoptions+=jnroc
set formatlistpat=^\s*\d\+[\]:.)}]\s*
"no 2 spaces after . when gq
set nojoinspaces

if has('mouse')
  set mouse=nvichar
end
" always show signcolumns
set signcolumn=yes

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

"---SWAP FILES---
if has('win32')
  let &directory = expand('~/.swp') . &directory
end

"---INDENT---

set cinoptions='(1s,M1' " read the docs yourself lol
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab  " end of an era i tell ya
set autoindent "keep indent when i create a new line
set shiftround "use C-t and C-d in i-mode to round the indent to a multiple of shiftwidth
if has('patch-7.4.388')
  set breakindent "preserve indent when wrapping lines
  " make wrapped lines at least 30 columns wide, and offset -2 columns to
  " account for the cool arrow on the next line
  let &breakindentopt='min:30,shift:-2'
end
let &showbreak="↪ " " show a cool arrow to indicate that's what happened

"---DIFFS---
set diffopt=filler,vertical
if has('patch-8.1.0360')
  set diffopt+=internal,algorithm:patience
end
if has('patch-8.1.1005')
  " not sure this is the actual correct patch
  " but it's where documentation was added:
  " https://github.com/vim/vim/commit/95bafa296ae97bf420d5c74dd6db517b404c5df7
  set diffopt+=iwhiteall
end
if has('patch-8.0.1361')
  set diffopt+=hiddenoff
end

"---CONCISENESS---
"keep stuff short and clean, in general

set shortmess=aoOsWAfil "help avoid hit-enter prompts
if has('patch-7.4.314')
  set shortmess+=c
end
set lazyredraw "don't redraw while executing macros, etc
set updatetime=300
