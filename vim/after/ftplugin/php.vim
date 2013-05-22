imap <buffer> <Leaderp>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <Leader>pu :call PhpInsertUse()<CR>

imap <buffer> <Leader>pe <C-O>:call PhpExpandClass()<CR>
map <buffer> <Leader>pe :call PhpExpandClass()<CR>

set foldlevel=1

let g:tdd_command = 'bin/phpunit -c app '
let g:tdd_dir = 'tests'

" Find using php-file-to-test
function! DetectPHPTest(filename)
    return system('~/.vim/bin/php-file-to-test ' . a:filename)
endfunction

autocmd BufWritePost *.php execute 'call TddLaunch(DetectPHPTest(expand("%:.")))'
