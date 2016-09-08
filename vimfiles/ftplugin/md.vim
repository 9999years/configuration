if exists("b:did_md_ftplugin")
  finish
endif
let b:did_md_ftplugin = 1

"md is for markdown
"au BufNewFile,BufRead *.md setfiletype markdown
setfiletype markdown

"spellcheck
setlocal spell

"space tabs in markdown
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
