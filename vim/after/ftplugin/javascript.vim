setlocal foldmethod=syntax
setlocal foldlevel=300
" setlocal foldlevel=8
" setlocal foldnestmax=3
" setlocal shiftwidth=2
" setlocal tabstop=2

let b:surround_63 = "if (\1\1) { \r }"

let g:tdd_command = 'clear; ./node_modules/.bin/mocha '
let g:tdd_dir = 'test'
let g:tdd_patterns = ['^test', '^spec']

" Find anything in test/ or spec/
function! DetectJavascriptTest(file, split)
    for prefix in g:tdd_patterns
        if a:split
            if a:file =~ "^test"
                return DetectJavascriptSource(a:file)
            endif
        else
            if a:file =~ prefix
                return a:file
            endif
        endif
    endfor
    return g:tdd_dir . '/' . a:file
endfunction

function! DetectJavascriptSource(file)
    let l:parts = split(a:file, "/")
    let l:removed = l:parts[1:]
    return join(l:removed, "/")
endfunction

nmap <Leader>ts :call TddSplit(DetectJavascriptTest(expand('%:.'), 1))<cr>
nmap <Leader>tr :call TddToggleAutoRestart()<cr>
