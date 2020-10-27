" Things that should probably be default in the first place {{{
if !has('nvim')
  set nocompatible
  filetype indent plugin on      "figure out filetype from file
  syntax on                      " syntax highlighting
endif

set number " Show line numbers. Why on Earth isn't this on by default??
set ruler                      " Show cursor position
set vb t_vb=                   " No visual bell
set hidden                     " don't just abandon buffers when i switch buffers
set backspace=indent,eol,start " make backspacing work the way it should
set wildmenu                   " visual command line completion
set wildignore=
      \.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,
      \*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls,*.hi,*.lock,*.aux,*.fdb_latexmk,
      \*.synctex.*
set wrap              " Yeah this should be default too. Wrap long lines.
set display+=lastline " Don't cut off the last line when it wont fit on the screen
set scrolloff=1
set breakat=\ !@*-+;:,./?=
set linebreak            " Break at a character in breakat rather than last char on screen
set splitright           " Make the diff windows make sense
set confirm              " Just ask me if I use :q instead of :q!
set formatoptions+=jnroc " Join comments, make numbered lists (!!) work
set nojoinspaces         " No 2 spaces after . when formatting with J or gq.
if has('mouse') | set mouse=nvichar | end
" }}}

" Colors, other display options {{{
" Enable 24-bit terminal colors.
if has('termguicolors') | set termguicolors | end

if !exists('g:loaded_colorscheme')
  let g:loaded_colorscheme = 1
  "silent! colorscheme Tomorrow-Night-Bright
  "silent! colorscheme nord
  "silent! colorscheme ubaryd

  " See: ../colors/molokai_dark_paren_fix.vim
  silent! colorscheme molokai_dark_paren_fix
endif

set conceallevel=2 " Concealed text is hidden unless it has a :syn-cchar
set list           " Display tabs and trailing spaces; see listchars
set listchars=tab:│\ ,trail:·,extends:…,nbsp:␣
set fillchars=vert:║,fold:\ ,diff:-
if has('patch-8.1.1564')
  set signcolumn=number  " Merge sign and number columns.
else
  set signcolumn=yes  " Always show signcolumn
end
" }}}

" Command-line {{{
" ...and other stuff in the bottom few lines of the screen
set wildmenu     " visual command line completion
set laststatus=2 " display status line
set showcmd      " show commands in the bottom right as i enter them
set cmdheight=2  " 2-row cmd-window; avoids PRESS ENTER TO CONTINUE
" }}}

" Searching {{{
set ignorecase " ignore case while searching
set smartcase  " unless the search contains caps
set hlsearch   " highlight all matches of a search
set incsearch  " jump to results as we find them
" }}}

" Swap files {{{
if has('win32')
  let &directory = expand('~/.swp') . &directory
end
" }}}

" Indentation {{{
set cinoptions='(1s,M1' " read the docs yourself lol
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab  " end of an era i tell ya
set autoindent " keep indent when i create a new line
set shiftround " use C-t and C-d in i-mode to round the indent to a multiple of shiftwidth
if has('patch-7.4.388')
  set breakindent "preserve indent when wrapping lines
  " make wrapped lines at least 30 columns wide, and offset -2 columns to
  " account for the cool arrow on the next line
  set breakindentopt=min:30,shift:-1
end
set showbreak=↪  " Show a cool arrow to indicate that's what happened
" }}}

" Diffs {{{
set diffopt=filler,vertical
if has('patch-8.1.0360')
  set diffopt+=internal,algorithm:patience
end
if has('patch-8.1.1005')
  " Not sure this is the actual correct patch, but it's where documentation
  " was added:
  " See: https://github.com/vim/vim/commit/95bafa296ae97bf420d5c74dd6db517b404c5df7
  set diffopt+=iwhiteall
end
if has('patch-8.0.1361')
  set diffopt+=hiddenoff
end
" }}}

" Conciseness {{{
set shortmess=aoOsWAfil " Help avoid hit-enter prompts
if has('patch-7.4.314')
  set shortmess+=c
end
set lazyredraw " Don't redraw while executing macros, etc
set updatetime=300
" }}}

" Folds {{{
set foldlevelstart=2
" }}}
