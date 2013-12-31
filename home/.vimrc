set nocompatible

" setup bundles
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Special setup for vimproc, need to compile native module
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Configure bundles
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'briancollins/vim-jst'
NeoBundle 'chrismetcalf/vim-yankring'
NeoBundle 'ciaranm/inkpot'
NeoBundle 'clones/vim-taglist'
NeoBundle 'dag/vim2hs'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'godlygeek/tabular'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'http://repo.or.cz/r/vcscommand.git'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'mfukar/robotframework-vim'
NeoBundle 'mjbrownie/Trac.vim'
NeoBundle 'osyo-manga/unite-quickfix'
NeoBundle 'panozzaj/vim-autocorrect'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'rstacruz/sparkup'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'shemerey/vim-peepopen'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'sjl/splice.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/asciidoc.vim'
NeoBundle 'vim-scripts/AutoTag'
NeoBundle 'vim-scripts/confluencewiki.vim'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/JavaScript-Indent'
NeoBundle 'vim-scripts/JSON.vim'
NeoBundle 'vim-scripts/paredit.vim'

filetype plugin indent on

" NeoBundle install check0
NeoBundleCheck

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
set relativenumber

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
  autocmd FocusLost * :set number
  autocmd FocusGained * :set relativenumber
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
"colorscheme molokai
 colorscheme solarized
set background=dark " do I want to do this? dunno.

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

" --- start of neocomplcache setting block

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" --- end neocomplcache setting block

" airline
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>F :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>/ :<C-u>Unite -no-split -buffer-name=grep grep:.<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=tag -start-insert tag/include<cr>
nnoremap <leader>h :<C-u>Unite -no-split -buffer-name=help -start-insert help<cr>
nnoremap <leader>u :<C-u>Unite -no-split -buffer-name=quickfix -start-insert quickfix<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" local defs, LEAVE THIS LAST
if filereadable($HOME."/.vimrc-local")
	so $HOME/.vimrc-local
endif
