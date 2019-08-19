"make j and k operate on screen lines.
"text selection still operates on file lines.
"this might cause problems with macros, idk
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"muscle memory
"this is unreliable
"why is this unreliable? shouldn't vim just intercept the keystrokes?
"make c-bs delete the current word
imap <C-BS> <C-W>

"map \cs to clear search
nnoremap <Leader>cs :let @/ = ""<CR>

" Insert codepoint on line below
nmap <Leader>cp "fcl<C-r>=printf('%x', char2nr(@f))<CR><ESC>
