

" Initial Setup {{{ -----------------------------------------------------------

set nocompatible
autocmd!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on
syntax on

set term=xterm-256color

" Set titlestring when switching buffers
autocmd BufEnter * let &titlestring = expand("%:t")

runtime macros/matchit.vim




" }}}
" Bundles {{{ ---------------------------------------------------------------

" IDE / Core
Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'fugitive.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/wombat256.vim'
Bundle 'sjl/clam.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdcommenter'
Bundle 'AdrianSchneider/vim-browser-reload-linux'

" Text Manipulation
Bundle 'AndrewRadev/sideways.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'argtextobj.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'godlygeek/tabular'
Bundle 'bkad/CamelCaseMotion'
Bundle 'tristen/vim-sparkup'
Bundle 'AndrewRadev/switch.vim'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-lastpat'

" Language Specific
Bundle 'beyondwords/vim-twig'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'techlivezheng/tagbar-phpctags'
Bundle 'AdrianSchneider/vim-javascript'
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
" Bundle 'spf13/PIV'

" Bundle 'jshint.vim' - missing node deps

" }}}
" Filetype specific options {{{ -----------------------------------------------

" No wrapping for the quickfix window
autocmd BufReadPost quickfix setlocal nowrap

" re-read vimrc after writing it
autocmd BufWritePost *vimrc source $HOME/.vimrc
autocmd BufRead *vimrc,*zshrc,*tmux.conf setlocal foldmethod=marker

" When editing a file, always jump to the last known cursor position
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" folding setup
let php_folding = 1
autocmd FileType css,php setlocal foldmethod=syntax
autocmd FileType html.twig setlocal foldmethod=marker foldmarker={%\ block,{%\ endblock

" completion setup
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" filetype setup
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
autocmd BufNewFile,BufRead *.less set syntax=css
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig filetype=html.twig

if getline(1) =~# '^#!.*/bin/env\s\+python\>'
    setfiletype python
endif
if getline(1) =~# '^#!.*/bin/env\s\+php\>'
    setfiletype php
endif
if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
endif

autocmd BufWritePost *.js execute "call TddLaunch(DetectJavascriptTest(expand('%:.'), 0))"
autocmd BufWritePost *.php execute 'call TddLaunch(DetectPHPTest(expand("%:.")))'



" }}}
" Custom highlighting  {{{ ----------------------------------------------------

colorscheme wombat256
highlight Normal ctermbg=None
hi Folded ctermfg=216
hi Folded ctermbg=None

" }}}
" General options {{{ ---------------------------------------------------------

let mapleader=","
set encoding=utf-8
set fileencodings=utf-8
set ruler
set pastetoggle=<F12>
"set title
set laststatus=2
set visualbell t_vb=
set formatoptions+=croqnwl
set ttyfast
set history=500
set nowrap
set linebreak
set showcmd
set nostartofline
set hidden
set backspace=indent,eol,start
set timeoutlen=500
set relativenumber
set autoread
set splitright
set shortmess=atI
set cursorline

set autoindent
set smartindent

set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smarttab

set incsearch
set hlsearch

set showmatch
set matchtime=2

set ignorecase
set smartcase
set gdefault

 set scrolloff=3
 set sidescroll=1
 set sidescrolloff=2

 set completeopt=longest,menuone

 if has("wildmenu")
     set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.git
     set wildignore+=*~,*.swp,*.tmp,.DS_Store
     set wildmenu
     set wildmode=longest,list
 endif

 set clipboard=unnamed

 set nobackup
 set noswapfile

 " Enable mouse usage in terminals
 " (allows window resizing, mousewheel scrolling, proper text highlighting)
 set mouse=n
 set ttymouse=xterm2
 " Workaround for bug in vim that breaks mouse support when in tmux.
 " bug: http://groups.google.com/group/vim_dev/browse_thread/thread/0416d81258cbb5a0?pli=1
 " workaround: https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
 if $TMUX != '' || $TERM == 'rxvt-256color'
     autocmd VimEnter * set ttymouse=xterm2
     autocmd FocusGained * set ttymouse=xterm2
     autocmd BufEnter * set ttymouse=xterm2
 endif

 if v:version >= '703'
     set undodir=~/.vim/undo
     set undofile
 endif




" }}}
" Key mappings {{{ ------------------------------------------------------------

" Typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Vs vs

" Change regex handling
nnoremap / /\v
vnoremap / /\v

nnoremap vv ^v$h

" Toggle wrapping
nnoremap <Leader>w :setlocal nowrap! nolist!<cr>

" quickly turn off search highlighting
map <Leader><space> :noh<cr>

" disable arrows
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" allow space to toggle folding
noremap <Space> za

" focus current fold from - https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
nnoremap <c-z> mzzMzvzz<c-e>

" semicolon for command mode
map ; :

map <F8> :TagbarToggle<CR>
map <leader>= :vertical resize 115

" delete trailing whitespace
map <leader>dtw :%s/\s\+$//e<cr>
nmap <leader>d :ene<CR>:bd #<CR>

" Custom PHP testing commands
map <Leader>un :!mkdir -p "`dirname \`~/.vim/bin/php-file-to-test %\``"<cr>:!touch "`~/.vim/bin/php-file-to-test %`"<cr><cr>:vs `~/.vim/bin/php-file-to-test %`<cr>
map <leader>ub :!bin/behat %<cr>
map <leader>bl ?Scenario<cr>:noh<cr>:exe "!bin/behat " . expand('%') . ":" . line('.')<cr>
map <leader>bl :exe "!bin/behat "`~/.vim/bin/php-scenario-to-line % \`line('.')\``"<cr>


" }}}
" Plugin configs {{{ ----------------------------------------------------------

" SudoEdit
cnoremap w!! w !sudo tee % >/dev/null

" PHPCtags
if executable($HOME . "/myconfig/phpctags/phpctags")
    let g:tagbar_phpctags_bin=$HOME.'/myconfig/phpctags/phpctags'
endif

" fugitive (git)
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gdiff<cr>
nmap <Leader>gg :Ggrep
nmap <Leader>glg :Glog<cr>
nmap <Leader>gc :Gcommit<cr>
nmap <Leader>gmv :Gmove
nmap <Leader>grm :Gremove
nmap <Leader>gpu :Git push<cr>
nmap <Leader>gt :w<cr>:bd<cr>:diffoff!<cr>
nmap <Leader>gta :Gread<cr>:w<cr>:bd<cr>:diffoff!<cr>
" clean up all those buffers fugitive leaves behind
nmap <Leader>gbd :bdelete fugitive://<C-A><cr>

" shift arguments left/right
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" nerdtree
let g:NERDTreeWinSize=40
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$']

nmap <Leader>n :NERDTreeCWD<cr>
nmap <Leader>nf :NERDTreeFind<cr>
nmap <Leader>nc :NERDTreeClose<cr>

nmap - :Switch<cr>

" phpqa
let g:phpqa_codecoverage_file = "$PWD/clover.xml"
let g:phpqa_codesniffer_args = "--standard=Symfony2"

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'web/coverage/|cache/'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/coverage/*
set wildignore+=*/cache/*
nnoremap <C-O> :CtrlPBuffer<cr>

" Powerline
let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" syntastic
nmap <Leader>e :Errors<cr>
let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1

" phpctags
let g:tagbar_phpctags_bin = '~/.vim/bin/phpctags/phpctags'

" Tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR> 


" }}}
" Custom functions and commands {{{ -------------------------------------------

:autocmd FileType php noremap <leader>>l :w!<CR>::!/usr/bin/env php -l %<CR>
:autocmd FileType php noremap <Leader>u :w!<CR>::!$PWD/bin/phpunit -c app `~/.vim/bin/php-file-to-test %`<CR>
:autocmd FileType php noremap <C-M> :w!<CR>::!/usr/bin/env php %<CR>

map <C-n> :execute ':edit ' . ClassToFile()<cr>

    " TDD {{{
    let g:tdd_command = ''
    let g:tdd_auto_restart = 0
    let g:tdd_fail_command = 'bp'
    let g:tdd_autorun = []
    let g:tdd_dir = 'test'
    let g:tdd_patterns = ['^test']
    let g:tdd_tmux_target = ''

    map <leader>tt :call AutoTestToggle(expand('%:.'))<cr>
    map <leader>t- :call AutoTestRemoveAll()<cr>

    function! TddLaunch(file)
        if g:tdd_command == ''
            return
        endif

        let l:testpath = a:file
        let l:testfiles = [l:testpath]
        let l:runfiles = []

        for i in g:tdd_autorun
            call add(l:testfiles, i)
        endfor

        for i in l:testfiles
            if filereadable(i)
                call add(l:runfiles, i)
            endif
        endfor


        if len(l:runfiles)
            let l:prefix = ""
            if g:tdd_auto_restart
               let  l:prefix = "forever restartall; "
            endif
            if !empty(g:tdd_fail_command)
                let l:run = l:prefix . g:tdd_command . join(l:runfiles, ' ') . ' || ' . g:tdd_fail_command
            else
                let l:run = l:prefix . g:tdd_command . join(l:runfiles, ' ')
            endif
            call TddTmuxSend(l:run)
        endif
    endfunction

    function! TddSplit(file)
        if filereadable(a:file)
            execute ':vs ' . a:file
            return
        endif

        let l:dir = system('dirname ' . a:file)
        call system('mkdir -p ' . l:dir)
        call system('touch ' . a:file)
        execute ':vs ' . a:file
    endfunction

    function! AutoTest(file)
        call add(g:tdd_autorun, a:file)
    endfunction

    function! AutoTestRemove(file)
        let l:new_autorun = []
        for i in g:tdd_autorun
            if i != a:file
                call add(l:new_autorun, a:file)
            endif
        endfor

        let g:tdd_autorun = l:new_autorun
    endfunction

    function! AutoTestToggle(file)
        if index(g:tdd_autorun, a:file) == -1
            call AutoTest(a:file)
        else
            call AutoTestRemove(a:file)
        endif
    endfunction

    function! TddSetTmuxTarget(target)
        let g:tdd_tmux_target = a:target
    endfunction

    function! TddToggleAutoRestart()
        let g:tdd_auto_restart = !g:tdd_auto_restart
    endfunction

    function! AutoTestRemoveAll()
        let g:tdd_autorun = []
    endfunction

    function! TddTmuxSend(cmd)
        let l:panes = TddTmuxCountPanes()
        if l:panes > 1 || strlen(g:tdd_tmux_target)
            call system('tmux send-keys -t ' . TddTmuxGetTarget() . ' "' . a:cmd . '" Enter')
        else
        endif
    endfunction

    function! TddTmuxCountPanes()
        return len(split(system('tmux list-panes'), "\n"))
    endfunction

    function! TddTmuxGetTarget()
        if strlen(g:tdd_tmux_target)
            return g:tdd_tmux_target
        endif
        let l:windows = split(system('tmux list-windows'), "\n")
        for windowinfo in l:windows
            if windowinfo =~ ".*active.*"
                return "0:" . windowinfo[0] . ".1"
            endif
        endfor
    endfunction
    " }}}

" }}}
