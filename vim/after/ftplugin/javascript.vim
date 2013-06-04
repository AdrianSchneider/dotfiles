setlocal foldmethod=syntax
setlocal foldlevel=8
setlocal foldnestmax=3
setlocal shiftwidth=2
setlocal tabstop=2

let b:surround_63 = "if (\1\1) { \r }"

let g:tdd_command = './node_modules/.bin/mocha '
let g:tdd_dir = 'test'
let g:tdd_patterns = ['^test', '^spec']

" Find anything in test/ or spec/
function! DetectJavascriptTest(file)
    for prefix in g:tdd_patterns
        if a:file =~ prefix
            return a:file
        endif
    endfor
    return g:tdd_dir . '/' . a:file
endfunction

nmap <Leader>ts :call TddSplit(DetectJavascriptTest(expand('%:.')))<cr>
