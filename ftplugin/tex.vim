if exists("b:did_customtex_ftplugin") | finish | endif
let b:did_customtex_ftplugin = 1

"spellcheck
setlocal spell
"but not in comments
let g:tex_comment_nospell= 1

setlocal textwidth=76
setlocal formatoptions+=t

function! s:Mathize(mode)
	if a:mode =~ '[vV]'
		exe "normal \<ESC>`>a$\<ESC>`<i$\<ESC>"
	elseif a:mode =~ 'n'
		exe "normal a$\<ESC>hi$\<ESC>l"
	endif
	silent! call repeat#set("\<Plug>Mathize", v:count)
endfunction

"vim probably has a better way to do this
"wrap selection with $
noremap <buffer> <Plug>Mathize :<C-U>call <SID>Mathize('n')<CR>
vnoremap <buffer> <Plug>Mathize :<C-U>call <SID>Mathize('v')<CR>
nmap <buffer> <leader>$ <Plug>Mathize
vmap <buffer> <leader>$ <Plug>Mathize
vnoremap <buffer> <leader>' <ESC>`>a'<ESC>`<i`<ESC>

"how did this even get fucked up
let b:NERDCommenterDelims = {'right': '', 'rightAlt': '', 'left': '%', 'leftAlt': ''}

"vim thinks latex commands like a\b{x} for any printing a, b, x are
"filenames if they end a line. so let's prevent that
let g:acp_behaviorFileLength = -1

"good formatting
"let g:vimtex_format_enabled=0
"let g:vimtex_imaps_enabled=0
"let g:vimtex_indent_on_ampersands=0
"let g:vimtex_view_enabled=0

"nnoremap <silent><buffer> } :call vimtex#motion#next_paragraph(0,0)<cr>
"nnoremap <silent><buffer> { :call vimtex#motion#next_paragraph(1,0)<cr>
"xnoremap <silent><buffer> } :<c-u>call vimtex#motion#next_paragraph(0,1)<cr>
"xnoremap <silent><buffer> { :<c-u>call vimtex#motion#next_paragraph(1,1)<cr>
"onoremap <silent><buffer> } :execute "normal v}"<cr>
"onoremap <silent><buffer> { :execute "normal v{"<cr>

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

function! Acronymize(mode)
	if a:mode ==# 'n'
		normal viw
	elseif a:mode ==? 'v'
		normal gv
	endif
	normal gu`>a}`<i\Sc{
endfunction

vmap <Leader>sc :<C-U>call Acronymize(visualmode())<CR>
nmap <Leader>sc :<C-U>call Acronymize(mode(1))<CR>
