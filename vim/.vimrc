


" Initial Setup {{{ -----------------------------------------------------------

" oops
let g:tdd_pipe=''

let g:ale_emit_conflict_warnings = 0
if isdirectory("./.idea")
  let g:loaded_ale_dont_use_this_in_other_plugins_please = 1
else
  let g:loaded_syntastic_plugin = 1
endif

set nocompatible
autocmd!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

filetype plugin indent on
syntax on

"set term=xterm-256color

" Set titlestring when switching buffers
autocmd BufEnter * let &titlestring = expand("%:t")

runtime macros/matchit.vim

" }}}
" Bundles {{{ ---------------------------------------------------------------
" >> IDE / Core {{{

" Open file/buffer by name
Bundle 'ctrlpvim/ctrlp.vim'

" Better file tree
Bundle 'scrooloose/nerdtree'

" Better statusbar
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

" Tags
Bundle 'majutsushi/tagbar'

" REPL
Bundle 'jpalardy/vim-slime'

" Git integration
Bundle 'tpope/vim-fugitive'
Bundle 'unimpaired.vim'
Bundle 'tpope/vim-rhubarb'
Bundle 'lambdalisue/vim-gita'

" Ack integration
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'joshdick/vim-action-ack'

" Snippets
Plugin 'SirVer/ultisnips'

" Async syntax checker
Bundle 'w0rp/ale'

" Sync syntax checker (use one at a time)
Bundle 'vim-syntastic/syntastic'

" Color scheme
Bundle 'vim-scripts/wombat256.vim'

" Shell command / buffer integration
Bundle 'sjl/clam.vim'

" Inline diffs
Bundle 'airblade/vim-gitgutter'

" Commenting hotkeys
Bundle 'scrooloose/nerdcommenter'

" Autocomplete
Bundle 'Valloric/YouCompleteMe'

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

" commenting verb
Bundle 'tpope/vim-commentary'

" casing, etc
Bundle 'tpope/vim-abolish'

" }}}
" >> Language Specific {{{

" Java
Bundle 'artur-shaik/vim-javacomplete2'
Bundle 'tpope/vim-classpath'

" typescript
Bundle 'Quramy/tsuquyomi'
Bundle 'leafgarland/typescript-vim'
Bundle 'Shougo/vimproc.vim'

" Twig Support
Bundle 'beyondwords/vim-twig'

" PHP Namespace helpers
Bundle 'arnaud-lb/vim-php-namespace'

" PHP Ctags
Bundle 'techlivezheng/tagbar-phpctags'

" Javascript support
Bundle 'pangloss/vim-javascript'

Bundle 'heavenshell/vim-prettier'

" Python support
Bundle 'hdima/python-syntax'

" Node.js enhancements
Bundle 'moll/vim-node'

" JSON Support
Bundle 'leshill/vim-json'

" LESS (css) support
Bundle 'groenewege/vim-less'

" Elixir
Bundle 'elixir-lang/vim-elixir'
Bundle 'slashmili/alchemist.vim'

" Java Maven
Bundle 'mikelue/vim-maven-plugin'

" Handlebars
Plugin 'mustache/vim-mustache-handlebars'

" Solidity
Plugin 'tomlion/vim-solidity'

" Markdown
Plugin 'SidOfc/mkdx'


" }}}
" >> Miscellaneous {{{

" vim-highlighted 'vimcat' command
Bundle 'rkitover/vimpager'

" highlight word under cursor after delay
Bundle 'RRethy/vim-illuminate'
" }}}
" >> Collaboration Tools {{{

Bundle 'junkblocker/patchreview-vim'
Bundle 'codegram/vim-codereview'
Bundle 'vim-codereviewer'

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
autocmd FileType java setlocal omnifunc=javacomplete#Complete


" }}}
" >> filetype setup {{{

autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig
autocmd BufNewFile,BufRead *.hbs set filetype=mustache
autocmd BufNewFile,BufRead *.less set syntax=css
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.ts set filetype=typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
autocmd BufNewFile,BufRead .vim.local set filetype=vim
autocmd BufNewFile,BufRead *.xml.j2 set filetype=xml
autocmd BufNewFile,BufRead *.html.twig set syntax=html.twig filetype=html.twig
autocmd BufNewFile,BufRead *.tsv set filetype=tsv
autocmd BufNewFile,Bufread qissues set syntax=yaml
autocmd BufNewFile,Bufread qissues.* set syntax=yaml
autocmd BufNewFile,Bufread *.exs set syntax=elixir filetype=elixir
autocmd BufNewFile,Bufread *.ex set syntax=elixir filetype=elixir
autocmd BufNewFile,Bufread *.sol set syntax=solidity filetype=solidity
autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile syntax=dockerfile

" }}

" filetype from hashbang {{{

" }}}

au BufRead,BufNewFile *.md set syntax=markdown filetype=markdown
autocmd BufNewFile,BufRead *.md execute "setf markdown"


" }}}

" }}}
" Custom highlighting  {{{ ----------------------------------------------------

colorscheme wombat256mod
highlight Normal ctermbg=None
hi Folded ctermfg=216
hi Folded ctermbg=None
hi illuminatedWord cterm=underline gui=underline ctermfg=216

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
set history=500
set nowrap
set linebreak
set nostartofline
set hidden
set backspace=indent,eol,start
set timeoutlen=500
set relativenumber
set autoread
set splitright
set shortmess=atI
set tabpagemax=100

" perfomrance tweaks
set ttyfast
set noshowcmd
set nocursorline
set lazyredraw
set regexpengine=1

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

if has('nvim')
    set ttimeout
    set ttimeoutlen=0
endif

if has("wildmenu")
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.git
    set wildignore+=*~,*.swp,*.tmp,.DS_Store,coverage,tags
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

" prevent * from going to next result
nmap * *``

" training wheels
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" }}}
" >> abbreviations {{{

ab nul null

cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Vs vs

iabbrev conosle console
iabbrev notificatoin notification

" }}}
" >> new mappings {{{

" Select line minus whitespace
nnoremap vv ^v$h

" Toggle wrapping
" nnoremap <Leader>w :setlocal nowrap! nolist!<cr>

" Search selection
vnoremap * y/\V<C-r>=escape(@",'/\')<CR><CR>``

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

nmap <leader>! tdd#tmux#send('!!')<cr>
nmap <leader>C tdd#tmux#send('C-c')<cr>

call camelcasemotion#CreateMotionMappings('<leader>')

nnoremap <c-j> :ALENextWrap<CR>
nnoremap <c-k> :ALEPreviousWrap<CR>
nnoremap <leader>= :ALEFix<CR>

nnoremap <leader>ha :GitGutterStageHunk<CR>
nnoremap <leader>hr :GitGutterStageHunk<CR>


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
"

set diffopt+=vertical

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
" >> Airline {{{

let g:airline_theme='wombat'
let g:airline_powerline_fonts=1
let g:airline#extensions#tagbar#enabled = 0


" }}}
" >> nerdtree {{{

let g:NERDTreeWinSize=40
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$', '\.class$']

nmap <Leader>n :NERDTreeCWD<cr>
nmap <Leader>nf :NERDTreeFind<cr>
nmap <Leader>nc :NERDTreeClose<cr>

" }}}
" >> REPL {{{

let g:codi#interpreters = {
       \ 'javascript': {
           \ 'bin': ['node', '-e', 'require("repl").start({ignoreUndefined: true, useGlobal: true})'],
           \ 'prompt': '^\(>\|\.\.\.\+\) ',
       \ },
   \}
let g:codi#log="/tmp/codi"

" }}}
" >> phpqa {{{

let g:phpqa_codecoverage_file = "$PWD/clover.xml"
let g:phpqa_codesniffer_args = "--standard=Symfony2"

" }}}
" >> ctrlp {{{

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'web/coverage/|cache/'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_lazy_update = 1
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.class
set wildignore+=*/coverage/*
set wildignore+=*/cache/*
set wildignore+=*/target/*
set wildignore+=*/build/*
set wildignore+=*/dist/*
set wildignore+=*/node_modules/*
set wildignore+=*/vendor/*
set wildignore+=*/bower_components/*
nnoremap <C-O> :CtrlPBuffer<cr>

" }}}
" >> ALE {{{

let g:ale_java_javac_options = '-Xlint -Xlint:-serial'
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 0

" }}}
" >> syntastic {{{

let g:syntastic_java_javac_delete_output = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1


" }}}
" >> ctags {{{

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
  \ }
let g:tagbar_phpctags_bin = '/usr/local/bin/phpctags'
let g:tagbar_sort=0
if executable($HOME . "/myconfig/phpctags/phpctags")
    let g:tagbar_phpctags_bin=$HOME.'/myconfig/phpctags/phpctags'
endif

" }}}
" >> tsuquyomi (typescript) {{{

let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_shortest_import_path = 1
let g:tsuquyomi_single_quote_import = 1

" }}}
" >> Tabularize {{{

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
"vnoremap <Leader>a| :Tabularize /|/<CR>
nmap <Leader>af :Tabularize /from/<CR>
vmap <Leader>af :Tabularize /from/<CR>

" }}}
" >> switch {{{

let g:switch_custom_definitions =
    \ [
    \   ['public', 'protected', 'private'],
    \   ['var', 'const', 'let']
    \ ]

" }}}
" >> ack {{{

let g:ack_use_dispatch = 1
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>

" }}}
" >> ultisnips {{{

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" }}}
" >> vim-slime (REPL) {{{

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
let g:slime_dont_ask_default = 1

" }}}
" }}}
" Custom functions and commands {{{ -------------------------------------------

if filereadable(".vim.local")
    so .vim.local
endif

nmap <leader>fh :w! ~/Pipes/http<cr>
vmap <leader>vh :w! ~/Pipes/http<cr>
nmap <leader>fq :w! ~/Pipes/query<cr>
vmap <leader>vq y:new /tmp/vimbuf<CR>VGp:x<CR>

" format json file
nmap <leader>jq= :%!jq .<CR>
"
" format json file (and sort by key)
nmap <leader>jqs :%!jq -S .<CR>


"
