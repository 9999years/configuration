runtime colors/molokai_dark.vim

" Reverse fg/bg for MatchParen so it 'looks right'
hi MatchParen guifg=#FD971F guibg=#000000 gui=bold

if &t_Co > 255
   hi MatchParen ctermfg=208 ctermbg=233 cterm=bold
end
