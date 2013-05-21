setlocal foldmethod=syntax
setlocal foldlevel=2
setlocal foldnestmax=3
setlocal shiftwidth=4
setlocal tabstop=4

let b:surround_63 = "if (\1\1) { \r }"

" Testing Hotkeys
map <Leader>un :!mkdir -p "`dirname \`~/.vim/bin/node-file-to-test %:.\``"<cr>:!touch "`~/.vim/bin/node-file-to-test %:.`"<cr><cr>:vs `~/.vim/bin/node-file-to-test %:.`<cr><cr>
map <Leader>u :w!<CR>::!node_modules/.bin/mocha `~/.vim/bin/node-file-to-test %:.`<CR>
