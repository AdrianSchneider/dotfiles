set tabstop=2
set shiftwidth=2
let g:syntastic_enable_elixir_checker = 0
let g:syntastic_elixir_checkers = ["elixir"]
let b:ale_linters = ['elixir-ls']
let b:ale_fixers = ['mix_format', 'remove_trailing_lines', 'trim_whitespace']
let g:ale_elixir_elixir_ls_release = "/Users/adrian/Downloads/elixirrr"
