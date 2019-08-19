if exists('g:did_commands_vim') | finish | endif
let g:did_commands_vim = 1

command -range=% -nargs=0           StripWhitespace   call misc#StripWhitespace(<line1>, <line2>)
command -nargs=0                    HighlightNonASCII call misc#HighlightNonASCII()
command -nargs=0                    UnsavedDiffOff    call misc#UnsavedDiffOff()
command -nargs=0                    UnsavedDiff       call misc#UnsavedDiff()
command -nargs=? -complete=filetype EditFtplugin      call misc#EditFtplugin(<f-args>)
command -nargs=? -complete=filetype EditAfterFtplugin call misc#EditAfterFtplugin(<f-args>)
command -nargs=? -complete=filetype EditUltiSnips     call misc#EditUltiSnips(<f-args>)
