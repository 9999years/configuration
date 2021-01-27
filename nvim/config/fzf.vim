if exists('b:did_custom_fzf_setup') | finish | endif
let b:did_custom_fzf_setup = 1

nnoremap <leader>f :<C-u>GFiles<CR>
nnoremap <leader>t :<C-u>Files<CR>
nnoremap <leader>b :<C-u>Buffers<CR>
nnoremap <leader>r :<C-u>Rg<Space>
