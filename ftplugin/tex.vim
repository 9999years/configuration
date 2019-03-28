" note this comes BEFORE the loading check!
highlight clear Conceal

if exists("b:did_customtex_ftplugin") | finish | endif
let b:did_customtex_ftplugin = 1

"spellcheck
setlocal spell

setlocal textwidth=76
setlocal formatoptions+=t
setlocal isident+=64
setlocal includeexpr=

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
