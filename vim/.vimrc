

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
" >> IDE / Core {{{

" Open file/buffer by name
Bundle 'ctrlp.vim'

" Better file tree
Bundle 'scrooloose/nerdtree'

" Better statusbar
Bundle 'Lokaltog/vim-powerline'

" Git integration
Bundle 'fugitive.vim'

" Ack integration
Bundle 'mileszs/ack.vim'

" Better snippets
Bundle 'msanders/snipmate.vim'

" Syntax checkers for various languages
Bundle 'scrooloose/syntastic'

" Color scheme
Bundle 'vim-scripts/wombat256.vim'

" Shell command / buffer integration
Bundle 'sjl/clam.vim'

" Inline diffs
Bundle 'airblade/vim-gitgutter'

" Commenting hotkeys
Bundle 'scrooloose/nerdcommenter'

" Automatically reload browser on save
Bundle 'AdrianSchneider/vim-browser-reload-linux'

" TDD plugins: open test in split, run tests on save, etc.
Bundle 'AdrianSchneider/vim-tdd'

" }}}
" >> Text Manipulation {{{

" Move arguments left/right
Bundle 'AndrewRadev/sideways.vim'

" Easily wrap text, or change surrounding chars
Bundle 'tpope/vim-surround.git'

" Text object: word columns
Bundle 'coderifous/textobj-word-column.vim'

" Text object: arguments
Bundle 'argtextobj.vim'

" Text object: indentation
Bundle 'michaeljsmith/vim-indent-object'

" Custom text objects
Bundle 'kana/vim-textobj-user'

" Text object: search matches
Bundle 'kana/vim-textobj-lastpat'

" Align text in columns
Bundle 'godlygeek/tabular'

" Text object: camel case word
Bundle 'bkad/CamelCaseMotion'

" HTML expansion
Bundle 'tristen/vim-sparkup'

" Toggle text values (true -> false, etc.)
Bundle 'AndrewRadev/switch.vim'

" Split and join text lines better
Bundle 'AndrewRadev/splitjoin.vim'

" }}}
" >> Language Specific {{{

" Twig Support
Bundle 'beyondwords/vim-twig'

" PHP Namespace helpers
Bundle 'arnaud-lb/vim-php-namespace'

" PHP Ctags
Bundle 'techlivezheng/tagbar-phpctags'

" Javascript support
Bundle 'AdrianSchneider/vim-javascript'

" JSON Support
Bundle 'leshill/vim-json'

" LESS (css) support
Bundle 'groenewege/vim-less'
" }}}
" >> Miscellaneous {{{

" vim-highlighted 'vimcat' command
Bundle 'rkitover/vimpager'
" }}}
" }}}
" Filetype specific options {{{ -----------------------------------------------

" No wrapping for the quickfix window
autocmd BufReadPost quickfix setlocal nowrap

" re-read vimrc after writing it
autocmd BufWritePost *vimrc source $HOME/.vimrc

" markers for config files
autocmd BufRead *vimrc,*zshrc,*tmux.conf setlocal foldmethod=marker
autocmd BufRead *vimrc setlocal foldlevel=0

" jump to last known position when possible
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif

" >> folding setup {{{

let php_folding = 1
autocmd FileType css,php setlocal foldmethod=syntax
autocmd FileType html.twig setlocal foldmethod=marker foldmarker={%\ block,{%\ endblock
autocmd FileType vim setlocal foldmethod=marker

" }}}
" >> completion setup {{{

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" }}}
" >> filetype setup {{{

autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
autocmd BufNewFile,BufRead *.hbs set syntax=html
autocmd BufNewFile,BufRead *.less set syntax=css
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead .vim.local set filetype=vim
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig filetype=html.twig
autocmd BufNewFile,BufRead *.tsv set filetype=tsv
autocmd BufNewFile,Bufread qissues set syntax=yaml

" }}

" filetype from hashbang {{{

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

au BufRead,BufNewFile *.md set syntax=markdown
autocmd BufNewFile,BufRead *.md execute "setf markdown"


" }}}

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
" >> change vim behaviour {{{

" semicolon for command mode
map ; :

" Change regex handling
nnoremap / /\v
vnoremap / /\v

" training wheels
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" }}}
" >> abbreviations {{{

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Vs vs

" }}}
" >> new mappings {{{

" Select line minus whitespace
nnoremap vv ^v$h

" Toggle wrapping
nnoremap <Leader>w :setlocal nowrap! nolist!<cr>

" clear search results
map <Leader><space> :noh<cr>

" allow space to toggle folding
noremap <Space> za

" delete trailing whitespace
map <leader>d :%s/\s\+$//e<cr>

" focus current fold from - https://bitbucket.org/sjl/dotfiles/src/tip/vim/vimrc
nnoremap <c-z> mzzMzvzz<c-e>

" tagbar
map <F8> :TagbarToggle<CR>

" Toggle folding
nmap <leader>fe :set foldenable<cr>
nmap <leader>fd :set nofoldenable<cr>

" }}}
" }}}
" Plugin configs {{{ ----------------------------------------------------------
" >> Misc {{{

" Toggle values
nmap - :Switch<cr>

" Sudo write
cnoremap w!! w !sudo tee % >/dev/null

" }}}
" >> vim-tdd {{{

let g:tdd_fail_command = 'bp'

let g:tdd_php_mapper = '~/.vim/bin/php-file-to-test'
function! DetectPHPTest(file)
    return system(g:tdd_php_mapper . ' ' . a:file)
endfunction
function! DetectXFTest(file)
    return system('~/.vim/bin/php-xf-file-to-test ' . a:file)
endfunction

" }}}
" >> fugitive (git) {{{

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

" }}}
" >> Sideways {{{

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

" }}}
" >> nerdtree {{{

let g:NERDTreeWinSize=40
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$']

nmap <Leader>n :NERDTreeCWD<cr>
nmap <Leader>nf :NERDTreeFind<cr>
nmap <Leader>nc :NERDTreeClose<cr>

" }}}
" >> phpqa {{{

let g:phpqa_codecoverage_file = "$PWD/clover.xml"
let g:phpqa_codesniffer_args = "--standard=Symfony2"

" }}}
" >> ctrlp {{{

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'web/coverage/|cache/'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*/coverage/*
set wildignore+=*/cache/*
nnoremap <C-O> :CtrlPBuffer<cr>

" }}}
" >> Powerline {{{

let g:Powerline_symbols = 'fancy'
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" }}}
" >> syntastic {{{

nmap <Leader>e :Errors<cr>
let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1

" }}}
" >> phpctags {{{

let g:tagbar_phpctags_bin = '~/.vim/bin/phpctags/phpctags'
if executable($HOME . "/myconfig/phpctags/phpctags")
    let g:tagbar_phpctags_bin=$HOME.'/myconfig/phpctags/phpctags'
endif

" }}}
" >> Tabularize {{{

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR> 

" }}}
" >> switch {{{

let g:switch_custom_definitions =
    \ [
    \   ['public', 'protected']
    \ ]

" }}}
" }}}
" Custom functions and commands {{{ -------------------------------------------

if filereadable(".vim.local")
    so .vim.local
endif
