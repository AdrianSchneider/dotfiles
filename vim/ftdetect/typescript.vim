" Detect javascript when its in the shebang
fun! s:DetectTypescript()
    if getline(1) == '#!./node_modules/.bin/ts-node'
        set ft=typescript
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectTypescript()
