if exists("b:did_tex_ftplugin") | finish | endif
let b:did_tex_ftplugin = 1
set syntax=plaintex

let b:did_ftplugin = 1

"dont indent pleas
let b:did_indent = 1
let g:tex_indent_brace = 0


"spellcheck
setlocal spell
"but not in comments
let g:tex_comment_nospell= 1

"vim probably has a better way to do this
"wrap selection with $
vnoremap <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
vnoremap <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
imap <C-e> \textit{
imap <C-b> \textbf{
imap <C-s> \textsc{

let g:syntastic_enable_signs=1
let g:syntastic_tex_checkers = []

command! Enum normal A\begin{enumerate}<CR>\end{enumerate}<ESC>O	\item 
command! Item normal A\begin{itemize}<CR>\end{itemize}<ESC>O	\item 
command! Align normal! A\ensuremath{\begin{aligned}<CR>\end{aligned}}<ESC>O	

"enter on a line with just an \item deletes the \item
imap <expr> <CR> getline('.') =~ '^\s*\\item\s\?$' ? '<C-u>' : '<CR>'

"autocomplete \begin{...} environments
"if line ends with a \begin{}, auto insert the matching \end and return to the
"env, having added an indent. the <SPACE><BS> makes vim not clear out the line
"so that indent is kept
"\v^.*(\\begin)\zs(\[[^\]]*\])?(\{(\a*\*?)+\})(\{.+\})(\[[^\]]*\])?$
imap <expr> }<CR> getline('.') =~ '\v^.*(\\begin)\zs(\[[^\]]*\])?(\{(\a*\*?)+\})(\{.+\})(\[[^\]]*\])?$' ? '}<CR><SPACE><BS><CR>' . substitute(getline('.'), '\v^.*(\\begin)\zs(\[[^\]]*\])?(\{(\a*\*?)+\})(\{.+\})(\[[^\]]*\])?$', '\\end\3', '') . '<UP><END>' : '}<CR>'
"imap <expr> ]<CR> getline('.') =~ '^.*{-}\\begin{.*}\(\[[^\]]*\]\)\?$' ? '}<CR><SPACE><BS><CR>' . substitute(getline('.'), '^.*\(\\begin\)\({.\{1,}\)\(\[[^\]]*\]\)\?', '\\end\2', '') . '<UP><END>' : '}<CR>'

"\\begin{.*}\[[^\]]*]$

"how did this even get fucked up. why is the right key before the left key
let b:NERDCommenterDelims = {'right': '', 'rightAlt': '', 'left': '%', 'leftAlt': ''}
