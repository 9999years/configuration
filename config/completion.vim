let g:UltiSnipsExpandTrigger = "<nop>"  " Default: <tab>
let g:UltiSnipsListSnippets  = "<nop>"  " Default: <c-tab>
let g:UltiSnipsEditSplit     = "horizontal"

      " \ 'coc-snippets',
let g:coc_global_extensions = [
      \ 'coc-ultisnips',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-python',
      \ 'coc-texlab',
      \ 'coc-java',
      \ 'coc-xml',
      \ 'coc-vimlsp',
      \ 'coc-rust-analyzer',
      \ 'coc-solargraph',
      \ 'coc-diagnostic' ]

inoremap <silent><expr> <TAB>
      \ pumvisible()
        \ ? coc#_select_confirm()
        \ : (<SID>check_back_space()
          \ ? "\<TAB>"
          \ : coc#refresh())

inoremap <expr> <S-TAB>
      \ pumvisible()
      \ ? "\<C-p>"
      \ : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-f> coc#_select_confirm()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format call CocAction('format')

"" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Select inside function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
" Select around function
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" Select inside class/struct/interface.
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
" Select around class/struct/interface. Recommended mapping:
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use F1 to show documentation in preview window
nnoremap <silent> <F1> <ESC>:call <SID>show_documentation()<CR>
" Action could also be 'showSignatureHelp'; not sure which is better here.
inoremap <silent> <F1> <ESC>:call CocActionAsync('doHover')<CR>a

" Use K to show documentation in preview window.
nnoremap <silent> K <ESC>:call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if coc#rpc#ready()
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<Left>"

"" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Show actions
nnoremap <silent><nowait> <space>a  :<C-u>CocAction<cr>
" Show all diagnostics
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Execute autofix
nnoremap <silent><nowait> <space>f  :<C-u>CocFix<CR>
" Run current code-lens thing
nmap     <silent><nowait> <space>r  <Plug>(coc-codelens-action)
