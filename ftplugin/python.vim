if exists('b:loaded_custom_python_ftplugin') | finish | end
let b:loaded_custom_python_ftplugin=1

function! SortImportsThenSave() abort
  " 2020-10-26: Yeah, this is fucking weird. Something to do with autocommands
  " behaving weirdly; writing in the before-write command is not expected; Vim
  " wants BufWritePost to undo BufWritePre commands, but I just want to make
  " changes that are *saved*.
  write
  call CocAction('runCommand', 'python.sortImports')
  write
endfunction

augroup python_custom
  autocmd!
  autocmd BufWritePre,FileWritePre <buffer> call SortImportsThenSave()
augroup END

setl foldmethod=marker
