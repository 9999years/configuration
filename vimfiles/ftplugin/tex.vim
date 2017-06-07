if exists("b:did_customtex_ftplugin") | finish | endif
let b:did_customtex_ftplugin = 1

"spellcheck
setlocal spell
"but not in comments
let g:tex_comment_nospell= 1

setlocal textwidth=76
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

"vim thinks latex commands like a\b{x} for any printing a, b, x are
"filenames if they end a line. so let's prevent that
let g:acp_behaviorFileLength = -1

"good formatting
let g:vimtex_format_enabled=0
let g:vimtex_imaps_enabled=0
let g:vimtex_indent_on_ampersands=0
let g:vimtex_view_enabled=0

nnoremap <silent><buffer> } :call vimtex#motion#next_paragraph(0,0)<cr>
nnoremap <silent><buffer> { :call vimtex#motion#next_paragraph(1,0)<cr>
xnoremap <silent><buffer> } :<c-u>call vimtex#motion#next_paragraph(0,1)<cr>
xnoremap <silent><buffer> { :<c-u>call vimtex#motion#next_paragraph(1,1)<cr>
onoremap <silent><buffer> } :execute "normal v}"<cr>
onoremap <silent><buffer> { :execute "normal v{"<cr>

"function! s:map(mode, lhs, rhs, ...)
  "if !hasmapto(a:rhs, a:mode)
        "\ && (a:0 > 0 || maparg(a:lhs, a:mode) ==# '')
    "silent execute a:mode . 'map <silent><buffer>' a:lhs a:rhs
  "endif
"endfunction

"call s:map('x', 'ip', '<plug>(vimtex-ip)')
"call s:map('x', 'ap', '<plug>(vimtex-ap)')
"call s:map('o', 'ip', '<plug>(vimtex-ip)')
"call s:map('o', 'ap', '<plug>(vimtex-ap)')
