" Settings
set foldmethod=syntax
set foldlevel=1
set wildignore+=*/target/*

" TDD Setup
nmap T :call tdd#tmux#send('mvn test')<CR>
function! JavaMavenMapper(file) 
  return system('~/.vim/bin/java-mapper fileToTest ' . expand('%'))
endfunction
function! EnableJavaMode()
    let g:tdd_map_callback = 'JavaMavenMapper'
    let g:tdd_test_command = '~/.vim/bin/java-runner '
endfunction

call EnableJavaMode()
autocmd BufNewFile,BufRead *.java execute "call EnableJavaMode()"
