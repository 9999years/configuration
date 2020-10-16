if exists('b:did_markdown_after_indent_custom') | finish | endif
let b:did_markdown_after_indent_custom = 1

" f: comment marker on first line only
" b: whitespace required after comment marker
" n: allow nested comments
"
" Mostly pretty self-explanatory, but `f:[` warrants further explanation; if
" we have a block of link definitions like this:
"     [1]: https://github.com/
"     [2]: https://gmail.com/
" making `[` a comment marker prevents Vim from autoformatting them like this:
"     [1]: https://github.com/ [2]: https://gmail.com/
setl comments=bn:>,fb:*,fb:+,fb:-,f:[
setl formatoptions+=tcrqanl
setl formatoptions-=j
