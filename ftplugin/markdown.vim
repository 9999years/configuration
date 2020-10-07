" if exists('b:did_custom_md_plugin') | finish | endif
let b:did_custom_md_plugin = 1

let g:vim_markdown_toml_frontmatter = 1

" Seems like most of this stuff is handled by vim-polyglot.
" See: ../plugged/vim-polyglot/indent/markdown.vim
" And what I do to undo its work:
" See: ../after/indent/markdown.vim

" setl sw=4
" setl ts=4
" setl expandtab
setl spell
