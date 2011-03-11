" call pathogen
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

syntax enable

" GUI "
if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA 
  set mouse=v
  if has("macunix")
    set guifont=Monaco:h12 "<- Maybe a good idea when using mac
  endif
endif
if has("macunix")
	set guifont=Monaco:h12
endif

let mapleader = ","

set nocompatible

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
"set number
set relativenumber

set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v][%{fugitive#statusline()}]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the rbuffer
"} 

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

" Handle long lines correctly
set wrap
" set textwidth=79
" set formatoptions=n
" set colorcolumn=80

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
" Set the tag file search order
set tags=./tags;
let Tlist_WinWidth = 60
" Use only current file to autocomplete from tags
set complete=.,t

" Use _ as a word-separator
set iskeyword-=_

" EXTERNAL COPY / PASTE "
set pastetoggle=<F2>
map <C-v> "+gP<CR>
vmap <C-c> "+y

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
map <Leader>ff :FufFile<CR>
map <Leader>fb :FufBuffer<CR>
map <Leader>fd :FufDir<CR>
map <Leader>ft :FufTag<CR>
map <Leader>fl :FufLine<CR>
map <Leader>fq :FufQuickfix<CR>

" Fugitive options
map <Leader>gw :Gwrite<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit -v<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>gD :Gdiff!<CR>

" Autocommands
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  " define autocommands here
  autocmd FileType python setlocal sw=4 sts=4 et
  autocmd FileType python compiler pyunit
  autocmd FileType python setlocal makeprg=${VIMHOME}/extras/run_all_python_tests_recursively.py
  autocmd FileType ruby,eruby,yaml,cucumber setlocal sw=2 sts=2 et
  autocmd FileType html,xhtml setlocal sw=2 sts=2 et
  autocmd FileType cpp setlocal sw=4 sts=4 et
  autocmd FileType php setlocal sw=2 sts=2 et
  autocmd FileType xml setlocal sw=2 sts=2 et
  autocmd FileType docbk setlocal sw=2 sts=2 et
  autocmd FileType mail,rst,markdown setlocal textwidth=78
  autocmd BufNewFile,BufRead *.email setlocal filetype=mail
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.qml setlocal filetype=qml sw=4 sts=4 et
endif

" this is for waf builds
let &efm = "%-GBuild finished successfully %.%#," . &efm

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
  source ~/.vim/bundle/vim-autocorrect/autocorrect.vim
endif

" colorscheme af
" colorscheme oceanblack
" colorscheme skittles_dark
" colorscheme twilight
" colorscheme mustang
" colorscheme clouds_midnight
colorscheme molokai

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

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>
