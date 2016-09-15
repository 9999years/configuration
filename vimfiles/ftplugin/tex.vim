let b:did_ftplugin = 1
if exists("b:did_tex_ftplugin") | finish | endif
let b:did_tex_ftplugin = 1

"let b:did_indent = 1
"let g:tex_indent_brace = 0

setlocal spell
"vim probably has a better way to do this
"wrap selection with $
vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
imap <C-e> \textit{
imap <C-b> \textbf{
imap <C-s> \textsc{
"silence that warning 38 (no punct. before quotes) bullshit
let g:syntastic_quiet_messages={
	\ "level": "warnings",
	\ "type": "style",
	\ "regex": "warning  38" }

command! Enum normal A\begin{enumerate}<CR>\end{enumerate}<ESC>O	\item 
command! Item normal A\begin{itemize}<CR>\end{itemize}<ESC>O	\item 
command! Align normal A\ensuremath{\begin{aligned}<CR>\end{aligned}}<ESC>O	
