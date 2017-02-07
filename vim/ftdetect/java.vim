nmap T :call tdd#tmux#send('mvn test')<CR>

function! JavaMavenMapper(file) 
  return system('~/.vim/bin/java-mapper fileToTest ' . expand('%'))
endfunction

autocmd BufNewFile,BufRead *.java execute "let g:tdd_map_callback = 'JavaMavenMapper'"
autocmd BufNewFile,BufRead *.java execute "let g:tdd_test_command = '~/.vim/bin/java-runner '"
