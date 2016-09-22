if exists("b:did_tex_ftplugin") | finish | endif
let b:did_tex_ftplugin = 1
let b:did_ftplugin = 1

set syntax=plaintex

let b:did_indent = 1
let g:tex_indent_brace = 0

setlocal spell

"vim probably has a better way to do this
"wrap selection with $
vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
imap <C-e> \textit{
imap <C-b> \textbf{
imap <C-s> \textsc{

"no signs
let g:syntastic_enable_signs = 0
"silence that warning 38 (no punct. before quotes) bullshit
"let g:syntastic_quiet_messages={
	"\ 'level': 'warnings',
	"\ 'type': 'style',
	"\ 'regex': 'warning  38' }

command! Enum normal A\begin{enumerate}<CR>\end{enumerate}<ESC>O	\item 
command! Item normal A\begin{itemize}<CR>\end{itemize}<ESC>O	\item 
command! Align normal! A\ensuremath{\begin{aligned}<CR>\end{aligned}}<ESC>O	

"enter on a line with just an \item deletes the \item
imap <expr> <CR> getline('.') =~ '^\s*\\item\s\?$' ? '<C-u>' : '<CR>'

"autocomplete \begin{...} environments
"if line ends with a \begin{}, auto insert the matching \end and return to the
"env, having added an indent. the <SPACE><BS> makes vim not clear out the line
"so that indent is kept
imap <expr> }<CR> getline('.') =~ '\\begin{[^}]\{1,}$' ? '}<CR><SPACE><BS><CR>' . substitute(getline('.'), '^.*\(\\begin\)\({[^}]\{1,}\)', '\\end\2}', '') . '<UP><END>'  : '}<CR>'

"how did this even get fucked up. why is the right key before the left key
let b:NERDCommenterDelims = {'right': '', 'rightAlt': '', 'left': '%', 'leftAlt': ''}
