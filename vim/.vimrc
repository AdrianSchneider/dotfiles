

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

" Text Manipulation
Bundle 'AndrewRadev/sideways.vim'
Bundle 'tpope/vim-surround.git'
Bundle 'coderifous/textobj-word-column.vim'
Bundle 'argtextobj.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'godlygeek/tabular'
Bundle 'bkad/CamelCaseMotion'
Bundle 'tristen/vim-sparkup'

" Language Specific
Bundle 'beyondwords/vim-twig'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'techlivezheng/tagbar-phpctags'
Bundle 'AdrianSchneider/vim-javascript'
Bundle 'leshill/vim-json'
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
autocmd FileType html.twig setlocal foldmethod=manual

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

if getline(1) =~# '^#!.*/bin/env\s\+python\>'
    setfiletype python
endif
if getline(1) =~# '^#!.*/bin/env\s\+php\>'
    setfiletype php
endif
if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
endif


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
nmap <Leader>W :SudoWrite<cr>
vmap <Leader>W :SudoWrite<cr>

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

" phpqa
let g:phpqa_codecoverage_file = "$PWD/clover.xml"
let g:phpqa_codesniffer_args = "--standard=Symfony2"

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'web/coverage/|cache/'
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


" }}}
" Custom functions and commands {{{ -------------------------------------------

:autocmd FileType php noremap <leader>>l :w!<CR>::!/usr/bin/env php -l %<CR>
:autocmd FileType php noremap <Leader>u :w!<CR>::!$PWD/bin/phpunit -c app `~/.vim/bin/php-file-to-test %`<CR>
:autocmd FileType php noremap <C-M> :w!<CR>::!/usr/bin/env php %<CR>

function! ClassToFile()
    let class = input('Class to create? ')
    let file =system('~/.vim/bin/php-class-to-file "' . class . '"')
    return file
endfunction

map <C-n> :execute ':edit ' . ClassToFile()<cr>

" }}}
