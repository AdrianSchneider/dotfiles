imap <buffer> <Leaderp>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <Leader>pu :call PhpInsertUse()<CR>

imap <buffer> <Leader>pe <C-O>:call PhpExpandClass()<CR>
map <buffer> <Leader>pe :call PhpExpandClass()<CR>

set foldlevel=1

" Testing Hotkeys
map <Leader>un :!mkdir -p "`dirname \`~/.vim/bin/php-file-to-test %\``"<cr>:!touch "`~/.vim/bin/php-file-to-test %`"<cr><cr>:vs `~/.vim/bin/php-file-to-test %`<cr>
map <leader>ub :!bin/behat %<cr>
map <leader>bl ?Scenario<cr>:noh<cr>:exe "!bin/behat " . expand('%') . ":" . line('.')<cr>
map <leader>bl :exe "!bin/behat "`~/.vim/bin/php-scenario-to-line % \`line('.')\``"<cr>
