setlocal foldmethod=syntax
setlocal foldlevel=1
setlocal foldnestmax=2

set tabstop=2
set shiftwidth=2

let b:surround_63 = "if (\1\1) { \r }"

let b:ale_fixers = ['prettier_eslint', 'remove_trailing_lines', 'trim_whitespace']

" convert selection to expression result
vmap <leader>re !node -p<CR>

" copy selection to clipboard
vmap <leader>ry :w !node -p \| pbcopy<CR><CR>

" send selection to tmux pane repl
vmap <leader>r<Enter> <Plug>SlimeRegionSend<CR>

" send selection to tmux pane repl
nnoremap <leader>rf ggVG :call slime#send_op(visualmode(), 1)<cr>

nmap <C-]> :YcmCompleter GoToDefinition<cr>


function! TestMapperReact(file)
  return system('map-test-react ' . a:file)
endfunction

function! TestSetupReact()
  let g:tdd_map_callback = 'TestMapperReact'
  let g:tdd_test_command = 'CI=true npm test '
endfunction
