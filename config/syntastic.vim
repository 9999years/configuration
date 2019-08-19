let g:syntastic_python_checkers = ['python3', 'mypy']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": ["rust", "python"],
  \ "passive_filetypes": ["tex"] }
