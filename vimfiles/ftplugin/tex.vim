if exists("b:did_customtex_ftplugin") | finish | endif
let b:did_customtex_ftplugin = 1

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

"no syntax
let g:syntastic_tex_checkers = []
"no signs
let g:syntastic_enable_signs = 0

command! Enum normal A\begin{enumerate}<CR>\end{enumerate}<ESC>O	\item 
command! Item normal A\begin{itemize}<CR>\end{itemize}<ESC>O	\item 
command! Align normal! A\ensuremath{\begin{aligned}<CR>\end{aligned}}<ESC>O	

"enter on a line with just an \item deletes the \item
imap <expr> <CR> getline('.') =~ '^\s*\\item\s\?$' ? '<C-u>' : '<CR>'
imap <expr> <CR> getline('.') =~ '^\s*%\s*$' ? '<C-u>' : '<CR>'

"autocomplete \begin{...} environments
"if line ends with a \begin{}, auto insert the matching \end and return to the
"env, having added an indent. the <SPACE><BS> makes vim not clear out the line
"so that indent is kept
"dont think about this too hard or youll explode and die
inoremap <expr> }<CR> getline('.') =~ '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$' ? '}<CR><SPACE><BS><CR>\end{' . matchstr(getline('.'), '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$') . '}<UP><END>' : '}<CR>'
inoremap <expr> ]<CR> getline('.') =~ '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$' ? ']<CR><SPACE><BS><CR>\end{' . matchstr(getline('.'), '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$') . '}<UP><END>' : ']<CR>'

"how did this even get fucked up. why is the right key before the left key
let b:NERDCommenterDelims = {'right': '', 'rightAlt': '', 'left': '%', 'leftAlt': ''}

"(siiighs)
hi clear texComment
hi link texComment Comment
