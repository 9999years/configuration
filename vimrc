call misc#begin()

call plug#begin() " Plugins {{{
Plug 'junegunn/vim-plug'                         " The plugin manager itself
Plug 'tpope/vim-repeat'                          " Better repeated mappings with plugins.
Plug 'tmhedberg/matchit'                         " Better % matching
Plug 'scrooloose/nerdcommenter'                  " Better commenting / comment toggling
So config/nerdcommenter.vim                      " (local nerdcommenter cfg)
Plug 'godlygeek/tabular'                         " Text table alignment
Plug '9999years/vim-titlecase'                   " Titlecasing commands; gtt
Plug 'tpope/vim-unimpaired'                      " Pairs of mappings
Plug 'junegunn/fzf'                              " Fuzzy finder
Plug 'junegunn/fzf.vim'                          " Extra fzf utils / commands: see :h fzf-vim
So config/fzf.vim                                " (local fzf cfg)
Plug 'tpope/vim-fugitive'                        " Git wrapper
Plug 'airblade/vim-gitgutter'                    " Git gutter
      \ { 'do': ':So config/vim-gitgutter.vim' } " (local gitgutter cfg)
Plug 'flazz/vim-colorschemes'                    " Color schemes
Plug 'neoclide/coc.nvim',                        " LSP client
      \ {'branch': 'release'}

Plug 'lambdalisue/fern.vim' | So config/fern.vim " File explorer
Plug 'lambdalisue/fern-git-status.vim'           " fern: display git status
Plug 'lambdalisue/nerdfont.vim'                  " fern: nerdfont support
Plug 'lambdalisue/fern-renderer-nerdfont.vim'    " fern: enable nerdfont
Plug 'lambdalisue/fern-hijack.vim'               " fern: use instead of netrw
Plug 'LumaKernel/fern-mapping-fzf.vim'           " fern: add fzf key bindings
Plug 'lambdalisue/fern-mapping-git.vim'          " fern: add git key bindings
Plug 'antoinemadec/FixCursorHold.nvim'           " fern: fix a perf issue in nvim

" Snippets
Plug 'SirVer/ultisnips'                " Snippet insertion
Plug 'honza/vim-snippets'              " Lots of predefined snippets
Plug '9999years/boilerplate-ultisnips' " Boilerplate insertion

" Language-specific plugins
" vim-polyglot includes (among many others):
"   - rust-lang/rust.vim
"   - cespare/vim-toml
"   - wavded/vim-stylus
"   - typescript
"   - isobit/vim-caddyfile
"   - dag/vim-fish
"   - idris-hackers/idris-vim
"   - pangloss/vim-javascript
Plug 'sheerun/vim-polyglot' | So config/polyglot.vim
So config/markdown.vim " polyglot includes vim-markdown

Plug 'rust-lang/rust.vim'
Plug 'vmchale/dhall-vim'
Plug 'chikamichi/mediawiki.vim'
Plug 'KeitaNakamura/tex-conceal.vim' | So config/tex.vim
Plug 'lervag/vimtex'
Plug 'alunny/pegjs-vim'
Plug 'vim-scripts/icalendar.vim'
Plug 'https://gitlab.com/n9n/vim-apl.git'
Plug 'qnighy/lalrpop.vim'
Plug 'leanprover/lean.vim'
call plug#end() " }}}

" General 'set' commands, colorscheme
So config/options.vim

" Anything autocomplete-related, including ultisnips and coc
So config/completion.vim

" Custom commands, usually matching a function in autoload/misc.vim
So config/commands.vim

" Mappings that *don't* relate to a plugin
So config/mappings.vim

call misc#end()
