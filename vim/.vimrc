

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


" }}}
" General options {{{ ---------------------------------------------------------

let mapleader=","                                                                                 
set encoding=utf-8
set fileencodings=utf-8
set ruler
set pastetoggle=<F12>
set title
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
     set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
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


cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Vs vs

" Change regex handling
nnoremap / /\v
vnoremap / /\v

" Toggle wrapping
nnoremap <Leader>w :setlocal nowrap! nolist!<cr>

" quickly turn off search highlighting
map <Leader><space> :noh<cr>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" allow space to toggle folding
noremap <Space> za

" Remap F1 to escape, because that happens a lot when reaching. :)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map ; :

map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>
map <F8> :TagbarToggle<CR>
map <leader>= :vertical resize 115
map <leader>dtw :%s/\s\+$//e<cr>
nmap <leader>d :ene<CR>:bd #<CR>
nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>                                                                 
nnoremap <C-O> :CtrlPBuffer<cr>
map <C-Up> :bnext<cr>
map <C-Down> :bprevious<cr>

" Custom PHP testing commands
" map <Leader>un :!mkdir -p "`dirname \`~/.vim/bin/php-file-to-test %\``"<cr>:!touch "`~/.vim/bin/ph
" map <leader>ub :!bin/behat %<cr>
" map <leader>bl ?Scenario<cr>:noh<cr>:exe "!bin/behat " . expand('%') . ":" . line('.')<cr>
" map <leader>bl :exe "!bin/behat "`~/.vim/bin/php-scenario-to-line % \`line('.')\``"<cr>



" Plugin configs {{{ ----------------------------------------------------------
" Custom functions and commands {{{ -------------------------------------------
" Local config settings {{{ ---------------------------------------------------
