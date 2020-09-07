call plug#begin()
Plug 'junegunn/vim-plug'

"Plug 'vim-airline/vim-airline-themes'
"Plug 'vim-airline/vim-airline' "status line
Plug 'tpope/vim-repeat'
Plug 'tmhedberg/matchit'        " better % matching
Plug 'scrooloose/nerdcommenter' " better comment toggling
Plug 'godlygeek/tabular'        " alignment
Plug '9999years/vim-titlecase'  " titlecasing commands
"Plug 'tpope/vim-unimpaired'
Plug 'wincent/command-t', { 'do': function('misc#BuildCommandT') } " fuzzy file finder
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'airblade/vim-gitgutter' " git gutter!

" Color scheme
"Plug 'Donearm/Ubaryd'
Plug 'flazz/vim-colorschemes'

" Autocomplete / language support
"Plug 'vim-scripts/AutoComplPop' "show autocomplete menu w/o prompt
"Plug 'ervandew/supertab'        " tab-completion
"Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Snippets
Plug 'SirVer/ultisnips' " snippets!
Plug 'honza/vim-snippets' " a bunch of predefined snippets
Plug '9999years/boilerplate-ultisnips' "boilerplate insertion

" Lang-specific plugins
" vim-polyglot includes (among many others):
"   - rust-lang/rust.vim
"   - cespare/vim-toml
"   - wavded/vim-stylus
"   - typescript
"   - isobit/vim-caddyfile
"   - dag/vim-fish
"   - idris-hackers/idris-vim
"   - pangloss/vim-javascript
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'vmchale/dhall-vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'lervag/vimtex'
Plug 'alunny/pegjs-vim'
Plug 'vim-scripts/icalendar.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'https://gitlab.com/n9n/vim-apl.git'
" Plug 'hyhugh/coc-erlang_ls', {'do': 'yarn install --frozen-lockfile'}
Plug 'qnighy/lalrpop.vim'
Plug 'leanprover/lean.vim'
Plug 'sukima/vim-tiddlywiki'
call plug#end()

let g:VIMFILES = misc#GetVimfiles()

" General 'set' commands, colorscheme
call misc#SourceRelative('config/options.vim')

" Anything autocomplete-related, including ultisnips and coc
call misc#SourceRelative('config/completion.vim')

" Useful global variables like $FISH and $PROFILE
call misc#SourceRelative('config/vars.vim')

" Custom commands, usually matching a function in autoload/misc.vim
call misc#SourceRelative('config/commands.vim')

" Autocommands that override an extension's filetype
call misc#SourceRelative('config/filetypes.vim')

" Mappings that *don't* relate to a plugin
call misc#SourceRelative('config/mappings.vim')

" Plugin-related configuration
"call misc#SourceRelative('config/airline.vim')
call misc#SourceRelative('config/command-t.vim')
call misc#SourceRelative('config/nerdcommenter.vim')
"call misc#SourceRelative('config/syntastic.vim')
call misc#SourceRelative('config/polyglot.vim')
call misc#SourceRelative('config/vim-gitgutter.vim')
