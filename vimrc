"this is my vimrc! hello!
"useful symbols:
"⋆≈❊╳⇠⍆≈⟡╬✚⟪⟫◇‼⚠⎇⚡↪↳⋱○✎
"all the arrows: https://pbs.twimg.com/media/CeKEybXWwAA2UkH.jpg:orig

"chill, represent chars as utf-8 internally
set encoding=utf-8
set nocompatible

if has('win32')
  let g:VIMFILES="~/vimfiles"
else
  let g:VIMFILES="~/.vim"
endif

function! BuildCommandT(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  let l:ruby='/usr/bin/ruby'
  if has('macunix') && !has('nvim')
    let l:ruby='/usr/local/opt/ruby/bin/ruby'
  endif

  if a:info.status != 'unchanged' || a:info.force
    if has('win32')
      !powershell ./make.ps1
    else
      exe '!cd ruby/command-t/ext/command-t && ' . l:ruby . ' extconf.rb && make'
    endif
  endif
endfunction

"---VIM-PLUG---
call plug#begin()
Plug 'junegunn/vim-plug'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-airline/vim-airline' "status line
Plug 'tpope/vim-repeat'
"Plug 'vim-scripts/AutoComplPop' "show autocomplete menu w/o prompt
Plug 'ervandew/supertab'        " tab-completion
Plug 'tmhedberg/matchit'        " better % matching
Plug 'scrooloose/nerdcommenter' " better comment toggling
Plug 'godlygeek/tabular'        " alignment
Plug '9999years/vim-titlecase'  " titlecasing commands
"Plug 'tpope/vim-unimpaired'
Plug 'wincent/command-t', { 'do': function('BuildCommandT') } " fuzzy file finder
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'vim-syntastic/syntastic'

Plug 'SirVer/ultisnips' " snippets!
Plug 'honza/vim-snippets' " a bunch of predefined snippets
Plug '9999years/boilerplate-ultisnips' "boilerplate insertion

"lang-specific plugins
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'cespare/vim-toml'
Plug 'stephenway/postcss.vim'
Plug 'isobit/vim-caddyfile'
Plug 'dag/vim-fish'
Plug 'idris-hackers/idris-vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'lervag/vimtex'

" color scheme
"Plug 'Donearm/Ubaryd'
Plug 'flazz/vim-colorschemes'
call plug#end()

"---MISC---
"mostly things that should probably be default in the first place

filetype indent plugin on      "figure out filetype from file
syntax on                      " syntax highlighting
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
\*.gif,*.pdf,*.bak,*.beam,*.exe,*.sw*,*~,*fls,*.hi
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

"join comments, make numbered lists (!!) work
set formatoptions+=jnroc
set formatlistpat=^\s*\d\+[\]:.)}]\s*
"no 2 spaces after . when gq
set nojoinspaces

if has('mouse')
  set mouse=nvichar
end

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

"---SWAP FILES---
if has('win32')
  let &directory = expand('~/.swp') . &directory
end

"---INDENT---

set cinoptions='(1s,M1' " read the docs yourself lol
set smarttab
set tabstop=8 "tabs are 8 characters wide
set shiftwidth=8
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
if has('patch-8.0.0360')
  set diffopt+=internal,algorithm:patience
end
if has('patch-8.0.1005')
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
set updatetime=750 "let's keep it Chill howabout

"---COMPLETIONS---
set completeopt=menu,menuone,longest
set pumheight=10
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"---MISC---

"i end up using this a lot ok
let $PROFILE="~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
let $FISH="~/.config/fish/config.fish"

if has('macunix') && exists('&rubydll')
  set rubydll=/usr/local/opt/ruby/lib/libruby.dylib
end

"---UNICODE---
"i made these bindings and i am extremely proud of them

"make \u insert the unicode point of the char under the cursor in nl above
nmap <Leader>p mf"fylo<C-r>=printf('U+%x', char2nr(@f))<CR><ESC>:call NERDComment(0, 'norm')<CR>`f

"\f replaces char under cursor with codepoint
nmap <Leader>f "fcl<C-r>=printf('%x', char2nr(@f))<CR><ESC>

"\F converts codepoint under cursor to char literal
nmap <Leader>F "fyawea <C-r>=nr2char('0x' . @f)<CR><ESC>

command! -range=% -nargs=0 StripWhitespace call misc#StripWhitespace(<line1>, <line2>)
command! -nargs=0 HighlightNonASCII call misc#HighlightNonASCII()
command! -nargs=0 UnsavedDiffOff call misc#UnsavedDiffOff()
command! -nargs=0 UnsavedDiff call misc#UnsavedDiff()
command! -nargs=? -complete=filetype EditFtplugin call misc#EditFtplugin(<f-args>)
command! -nargs=? -complete=filetype EditAfterFtplugin call misc#EditAfterFtplugin(<f-args>)
command! -nargs=? -complete=filetype EditUltiSnips call misc#EditUltiSnips(<f-args>)

"---AIRLINE---
let g:airline_theme='molokai'
colorscheme molokai
function! AirlineInit()
  AirlineTheme molokai
  let g:airline#extensions#bufferline#enabled=0
  let g:airline#extensions#syntastic#enabled=0
  let g:airline#extensions#whitespace#enabled=0
  let g:airline#extensions#wordcount#enabled=1
  let g:airline#extensions#wordcount#filetypes =
    \ ['markdown', 'rst', 'org', 'help', 'text']
  "let g:airline_section_error = airline#section#create(['branch'])
  let g:airline_section_a     = '%{substitute(mode(), "CTRL-", "^", "g")}'
  let g:airline_section_b     = airline#section#create(['ffenc'])
  "let g:airline_section_error = airline#section#create(['syntastic'])
  "see 'statusline'
  "let g:airline_section_c     = '%{expand(''%:h:t'')}/%t %m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
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
  if has('macunix') and !has('nvim')
    let g:airline_symbols.readonly='RO'
    let g:airline_symbols.linenr='L'
  else
    let g:airline_symbols.readonly=''
    let g:airline_symbols.linenr=''
  end
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"---LaTeX---
autocmd BufRead *.cls set filetype=tex
let g:tex_flavor = 'latex'
"no spellchecking in tex comments
let g:tex_comment_nospell= 1
let g:vimtex_compiler_enabled=0
let g:vimtex_include_search_enabled=0
let g:vimtex_view_enabled=0
let g:vimtex_quickfix_mode=0
let g:tex_conceal='abdmg'
let g:vimtex_imaps_leader='@'

"---MARKDOWN---
let g:vim_markdown_toml_frontmatter = 1

"---YAML---
let g:yaml_schema='pyyaml'

"---NERD---
let g:NERDAltDelims_fsharp = 1

"---ULTISNIPS---
if has('python3')
  let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDirectories = [
  \ expand(g:VIMFILES . '/plugged/snips'),
  \ expand(g:VIMFILES . '/plugged/vim-snippets/UltiSnips')]

"---COMMAND-T---
nmap <C-p> :CommandTBuffer<cr>

"---SYNTASTIC---
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["rust", "python"],
  \ "passive_filetypes": ["tex"] }
