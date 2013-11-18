setlocal shiftwidth=2
setlocal tabstop=2

set fde=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set fdm=expr

" TDD Config {{{
    map <leader>ub :!bin/behat %<cr>
    map <leader>bl ?Scenario<cr>:noh<cr>:exe "!bin/behat " . expand('%') . ":" . line('.')<cr>
    map <leader>bl :exe "!bin/behat "`~/.vim/bin/php-scenario-to-line % \`line('.')\``"<cr>
" }}}
