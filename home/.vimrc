set nocompatible
filetype off

" setup vundle
set rtp+=~/.vim/vundle
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Configure vundle bundles
Bundle "Lokaltog/powerline"
Bundle "scrooloose/syntastic"
Bundle 'altercation/vim-colors-solarized'
Bundle 'briancollins/vim-jst'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'ciaranm/inkpot'
Bundle 'clones/vim-taglist'
Bundle 'codegram/vim-numberlock'
"Bundle 'codegram/vim-todo'
Bundle 'digitaltoad/vim-jade'
Bundle 'evidens/vim-twig'
Bundle 'godlygeek/tabular'
Bundle 'http://repo.or.cz/r/vcscommand.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'mfukar/robotframework-vim'
Bundle 'mileszs/ack.vim'
Bundle 'mjbrownie/Trac.vim'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'rosstimson/scala-vim-support'
Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'shemerey/vim-peepopen'
Bundle 'sjl/gundo.vim'
Bundle 'sjl/splice.vim'
Bundle 'taq/vim-rspec'
Bundle 'tomtom/tlib_vim'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
if !exists("g:disable_fugitive")
  Bundle 'tpope/vim-fugitive'
endif
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/asciidoc.vim'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/confluencewiki.vim'
"Bundle 'vim-scripts/Gist.vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/javacomplete'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'vim-scripts/JSON.vim'
Bundle 'vim-scripts/maven2.vim'
Bundle 'vim-scripts/MediaWiki-folding-and-syntax-highlight'
Bundle 'vim-scripts/Rainbow-Parenthesis'
Bundle 'vim-scripts/TWiki-Syntax'
Bundle 'wavded/vim-stylus'
Bundle 'wayneeseguin/snipmate.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'

filetype plugin indent on
syntax enable

" activate powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" GUI "
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA 
  set mouse=v
  set guifont=Inconsolata\ for\ Powerline:h12
endif

let mapleader = ","

set modelines=5
set modeline

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=2
set laststatus=2
" only one or the other of these is supposed to be set at one time
set number
"if version >= 703
"	set relativenumber
"endif

if !exists("g:disable_fugitive")
  set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v][%{fugitive#statusline()}]
endif

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
" nnoremap <tab> %
" vnoremap <tab> %

:nmap <Space> /

set formatoptions=tcqn

" Show invisible characters
" set list
" set listchars=tab:▸\ ,eol:¬

" Move around lines
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" inoremap <Esc> <nop>

nnoremap j gj
nnoremap k gk

" Map ESC
imap jj <ESC>
nnoremap ; :

" ACK
" Use Ack instead of grep
set grepprg=ack

" ,a to Ack
nnoremap <leader>a :Ack 

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
nmap <leader>d :bd<CR>
nmap <leader>D :bufdo bd<CR>

" Saving and buffer stuff
" :wqa! Quit saving
nmap <leader>Q :wqa!<CR>
nmap <leader>q :wq!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" Tag list settings
map <leader>l :TlistToggle <cr>
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Close_On_Select=1
let Tlist_Inc_Winwidth=0
" Set the tag file search order
set tags=./tags;
let Tlist_WinWidth = 60
" Use only current file to autocomplete from tags
set complete=.,t

" Use _ as a word-separator
set iskeyword-=_

" EXTERNAL COPY / PASTE "
set pastetoggle=<F2>
map <C-y> "+gP<CR>
vmap <C-c> "+y

" Q formats marked text or current paragraph
vmap Q gq
nmap Q gqap

" PeepOpen
map <leader>o <Plug>PeepOpen

" NERD tree settings
let NERDTreeShowBookmarks = 1
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50 
map <leader>p :NERDTreeToggle<cr>

" OmniCpp settings
let OmniCpp_MayCompleteScope=1
let OmniCpp_SelectFirstItem=2
set completeopt=menuone,preview,longest

" spell settings
map <Leader>se :setlocal spell spelllang=en_gb<CR>
map <Leader>sf :setlocal spell spelllang=fi_fi<CR>
map <Leader>sn :setlocal nospell<CR>

" FuzzyFinder options
"map <Leader>ff :FufFile<CR>
"map <Leader>fb :FufBuffer<CR>
"map <Leader>fd :FufDir<CR>
"map <Leader>ft :FufTag<CR>
"map <Leader>fl :FufLine<CR>
"map <Leader>fq :FufQuickfix<CR>
"map <Leader>fr :FufRenewCache<CR>

if !exists("g:disable_fugitive")
  " Fugitive options
  map <Leader>gw :Gwrite<CR>
  map <Leader>gs :Gstatus<CR>
  map <Leader>gc :Gcommit -v<CR>
  map <Leader>gd :Gdiff<CR>
  map <Leader>gD :Gdiff!<CR>
endif

" Remap VCSCommand commands because nerdcomment uses <Leader>c
let g:VCSCommandMapPrefix='<Leader>k'

" Autocommands
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  " define autocommands here
  autocmd FileType python compiler pyunit
  autocmd FileType python setlocal makeprg=${VIMHOME}/extras/run_all_python_tests_recursively.py
  autocmd FileType mail,rst,markdown setlocal textwidth=78
  autocmd BufNewFile,BufRead *.email setlocal filetype=mail
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Guardfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.qml setlocal filetype=qml sw=4 sts=4 et
  autocmd BufNewFile,BufRead *.json setlocal filetype=json
  autocmd BufNewFile,BufRead *.zsh-theme setlocal filetype=zsh
  autocmd BufNewFile,BufRead *.handlebars setlocal filetype=html
  autocmd FileType java setlocal sw=4 sts=4 et omnifunc=javacomplete#Complete
  autocmd FileType text setlocal colorcolumn=80 wrap textwidth=79
endif

augroup BWCCreateDir
	au!
	autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p %:h" | redraw! | endif
augroup END

" this is for waf builds
let &efm = "%-GBuild finished successfully %.%#," . &efm

" this is for ant
let &efm = "%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#," . &efm

" for rsense
let g:rsenseHome = $RSENSE_HOME

" for trac
let g:tracServerList = {}

" for vim-rspec
let g:RspecBin = "rspec"

" AutoClose
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'} 
let g:AutoCloseProtectedRegions = ["Character"] 

" Execute current buffer as ruby
map <S-r> :w !ruby<CR>

let my_home = expand("$HOME/")

if filereadable(my_home . '.vim/bundle/vim-autocorrect/autocorrect.vim')
	map <Leader>aa :source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
	map <Leader>ac :abc
endif

" colorscheme af
" colorscheme oceanblack
" colorscheme skittles_dark
" colorscheme twilight
" colorscheme mustang
" colorscheme clouds_midnight
colorscheme molokai
" colorscheme solarized
set background=dark " do I want to do this? dunno.

" local defs, LEAVE THIS LAST
if filereadable($HOME."/.vimrc-local")
	so $HOME/.vimrc-local
endif

" NOW SERIOUSLY
set nobackup
set nowritebackup
set noswapfile

" BLAAAME
vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

" Tabularize
if exists(":Tab")
  nmap <leader>a\| :Tab /\|<CR>
  vmap <leader>a\| :Tab /\|<CR>
  nmap <leader>a= :Tab /=<CR>
  vmap <leader>a= :Tab /=<CR>
  nmap <leader>a: :Tab /:\zs<CR>
  vmap <leader>a: :Tab /:\zs<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

" Map Ctrl-i to Ctrl-] because the latter is apparently impossible to
" type on a mac with a keyboard that requires alt for ].
map <C-i> <C-]>

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" Make ctrlp not manage the working directory
let g:ctrlp_working_path_mode = 0
" Make ctrlp not find dotfiles
let g:ctrlp_dotfiles = 0

" error format for sbt-quickfix plugin
" (https://github.com/dscleaver/sbt-quickfix)
set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
set errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
set errorformat+=,%-G%.%#

noremap <silent> <Leader>ff :cf target/quickfix/sbt.quickfix<CR>
noremap <silent> <Leader>fn :cn<CR>

" I want 2 space indentation dammit
set sw=2 sts=2 et
