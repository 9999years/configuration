if exists('b:loaded_custom_python_ftplugin') | finish | end
let b:loaded_custom_python_ftplugin=1

function! SortImportsThenSave() abort
  " 2020-10-26: Yeah, this is fucking weird. Something to do with autocommands
  " behaving weirdly; writing in the before-write command is not expected; Vim
  " wants BufWritePost to undo BufWritePre commands, but I just want to make
  " changes that are *saved*.
  if (!exists('b:coc_enabled') || !b:coc_enabled)
        \ && index(
        \ coc#util#get_config('coc.preferences').formatOnSaveFiletypes,
        \ "python") >= 0
    write
    call CocAction('runCommand', 'python.sortImports')
    write
  end
endfunction

augroup python_custom
  autocmd!
  autocmd BufWritePre,FileWritePre <buffer> call SortImportsThenSave()
augroup END
