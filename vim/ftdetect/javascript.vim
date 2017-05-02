" Detect javascript when its in the shebang
fun! s:DetectNode()
    if getline(1) == '#!/usr/bin/env node'
        set ft=javascript
    endif
endfun

let g:tdd_test_command = './node_modules/.bin/mocha -t 3000'

autocmd BufNewFile,BufRead * call s:DetectNode()
