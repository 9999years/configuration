if exists("b:did_customtex_ftplugin") | finish | endif
let b:did_customtex_ftplugin = 1

"spellcheck
setlocal spell
"but not in comments
let g:tex_comment_nospell= 1

setlocal textwidth=80
setlocal formatoptions+=t

"vim probably has a better way to do this
"wrap selection with $
vnoremap <buffer> <leader>$ <ESC>`>a$<ESC>`<i$<ESC>
vnoremap <buffer> <leader>' <ESC>`>a'<ESC>`<i`<ESC>
"various insert mode formatting things
imap <buffer> <C-e> \textit{
imap <buffer> <C-b> \textbf{
imap <buffer> <C-s> \textsc{

"enter on a line with just an \item deletes the \item
imap <buffer> <expr> <CR> getline('.') =~ '^\s*\\item\s\?$' ? '<C-u>' : '<CR>'
imap <buffer> <expr> <CR> getline('.') =~ '^\s*%\s*$' ? '<C-u>' : '<CR>'

"autocomplete \begin{...} environments
"if line ends with a \begin{}, auto insert the matching \end and return to the
"env, having added an indent. the <SPACE><BS> makes vim not clear out the line
"so that indent is kept
"dont think about this too hard or youll explode and die
inoremap <expr> }<CR> getline('.') =~ '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$' ? '}<CR><SPACE><BS><CR>\end{' . matchstr(getline('.'), '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$') . '}<UP><END>' : '}<CR>'
inoremap <expr> ]<CR> getline('.') =~ '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$' ? ']<CR><SPACE><BS><CR>\end{' . matchstr(getline('.'), '\v^.*(\\begin)(\[[^\]]*\])?\{\zs([[:alpha:]\*]*)\ze\}?(\{.*\})*(\[[^\]]*\]?)?$') . '}<UP><END>' : ']<CR>'

"how did this even get fucked up
let b:NERDCommenterDelims = {'right': '', 'rightAlt': '', 'left': '%', 'leftAlt': ''}

packadd YouCompleteMe
let g:ycm_semantic_triggers = {
	\ 'tex' : ['{','\'],
	\ }
