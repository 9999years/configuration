if exists('g:did_completion_opts') | finish | endif
let g:did_completion_opts = 1

if has('python3')
  let g:UltiSnipsUsePythonVersion = 3
endif
let g:UltiSnipsExpandTrigger       = "<nop>"  " Default: <tab>
let g:UltiSnipsListSnippets        = "<nop>"  " Default: <c-tab>
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"  " Default: <c-j>
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"  " Default: <c-k>

let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsSnippetDir = misc#RelFile('plugged/snips')
let g:UltiSnipsSnippetDirectories = [
  \ misc#RelFile('plugged/snips'),
  \ misc#RelFile('plugged/vim-snippets/UltiSnips')]
let g:coc_snippet_prev = '<nop>' " ughh
let g:coc_snippet_next = '<nop>'

function! s:rebind_ctrl_j()
  inoremap <C-j> <c-r>=UltiSnips#JumpForwards()<cr>
endfunction
call <SID>rebind_ctrl_j()

function! s:select_rebind()
  call <SID>rebind_ctrl_j()
  return coc#_select_confirm()
endfunction

""""""""""""""
"  coc-nvim  "
""""""""""""""

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
      \ 'coc-rls',
      \ 'coc-solargraph',
      \ 'coc-diagnostic' ]

inoremap <silent><expr> <TAB>
      \ pumvisible()
        \ ? <SID>select_rebind()
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

command! -nargs=0 Format call CocAction('format')

"" Use `[d` and `]d` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
"nnoremap <silent> U :call <SID>show_documentation()<CR>

"" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Execute autofix
nnoremap <silent> <space>f  :<C-u>CocFix<CR>
" Run current code-lens thing
nmap <space>r  <Plug>(coc-codelens-action)
