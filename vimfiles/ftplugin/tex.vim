if exists("b:did_tex_ftplugin")
  finish
endif
let b:did_tex_ftplugin = 1

"oh christ, tex stuff
setlocal spell
"vim probably has a better way to do this
"wrap selection with $
vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
imap <C-e> \textit{
imap <C-b> \textbf{
imap <C-s> \textsc{
"split lines in a semi-intelligent manner
"this sux don't use it
nmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
vmap <leader>b :s/ *\([.;]\\|''\\|``\) */\1\r/ge<cr>:noh<cr>
"silence that warning 38 (no punct. before quotes) bullshit
let g:syntastic_quiet_messages={
	\ "level": "warnings",
	\ "type": "style",
	\ "regex": "warning  38" }
