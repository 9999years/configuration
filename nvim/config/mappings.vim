" Make j and k operate on screen lines.
" Text selection still operates on file lines; these are normal-mode mappings
" only.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"map \cs to clear search
nnoremap <Leader>cs :let @/ = ""<CR>

" Correct last spelling mistake; from https://castel.dev/post/lecture-notes-1/
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <Leader>l mp[s1z=`p
