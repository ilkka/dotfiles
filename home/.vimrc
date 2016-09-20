set nocompatible

let mapleader = ","
let maplocalleader = "\\"

" setup bundles
set rtp+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))

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

" colors and theming
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kien/rainbow_parentheses.vim'

" widgets and utils
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'clones/vim-taglist'
NeoBundle 'shemerey/vim-peepopen'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/YankRing.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'sjl/splice.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'
NeoBundle 'hecal3/vim-leader-guide'

" formatting and linting
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/JavaScript-Indent'

" autocompletion
NeoBundle 'marijnh/tern_for_vim'
"NeoBundle 'Shougo/neocomplcache.vim'

" programming language support
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'docker/docker', {'rtp': 'contrib/syntax/vim'}
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'elmcast/elm-vim'
NeoBundle 'evidens/vim-twig'
NeoBundle 'groenewege/vim-less'
NeoBundle 'guns/vim-clojure-static'
"NeoBundle 'mxw/vim-jsx'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim'}
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-leiningen'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-git'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'vim-scripts/asciidoc.vim'
NeoBundle 'vim-scripts/JSON.vim'
"NeoBundle 'lambdatoast/elm.vim.git'

" fuzzy file / other things finder
"NeoBundle 'osyo-manga/unite-quickfix'
"NeoBundle 'Shougo/unite-help'
"NeoBundle 'Shougo/unite-outline'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'ivalkeen/vim-ctrlp-tjump'
NeoBundle 'tacahiroy/ctrlp-funky'
NeoBundle 'jasoncodes/ctrlp-modified.vim'

call neobundle#end()

filetype plugin indent on

" NeoBundle install check0
NeoBundleCheck

" Define Top Level Dictionary for leader guide
let g:lmap =  {}

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
 
" colorscheme af
" colorscheme oceanblack
" colorscheme skittles_dark
" colorscheme twilight
" colorscheme mustang
" colorscheme clouds_midnight
" colorscheme molokai
let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark

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
"set cursorline
set ttyfast
set ruler
set backspace=2
set laststatus=2
" only one or the other of these is supposed to be set at one time
set number
"set relativenumber

if !exists("g:disable_fugitive")
  set statusline=%F%m%r%h%w[%L]%y[%p%%][%04v][%{fugitive#statusline()}]
endif

" editing and sourcing vimrc
"nnoremap <leader>ev :split $MYVIMRC<CR>
"nnoremap <leader>eV :vsplit $MYVIMRC<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>

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

:nnoremap <Space> /

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

nnoremap j gj
nnoremap k gk
nnoremap H g0
nnoremap L g$

" Map ESC
inoremap jk <ESC>
"inoremap <Esc> <nop>

" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l
" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch between buffers
"noremap <tab> :bn<CR>
"noremap <S-tab> :bp<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bufdo bd<CR>

" Saving and buffer stuff
" :wqa! Quit saving
nnoremap <leader>Q :wqa!<CR>
nnoremap <leader>q :wq!<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader><Esc> :q!<CR>

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
"set complete=.,t

" Use _ as a word-separator
set iskeyword-=_

" EXTERNAL COPY / PASTE "
set pastetoggle=<F2>
noremap <C-y> "+gP<CR>
vnoremap <C-c> "+y

" Q formats marked text or current paragraph
vnoremap Q gq
nnoremap Q gqap

" PeepOpen
noremap <leader>o <Plug>PeepOpen

" NERD tree settings
"let NERDTreeShowBookmarks = 1
"let NERDChristmasTree = 1
"let NERDTreeWinPos = "left"
"let NERDTreeHijackNetrw = 1
"let NERDTreeQuitOnOpen = 1
"let NERDTreeWinSize = 50 
"noremap <leader>p :NERDTreeToggle<cr>

" OmniCpp settings
"let OmniCpp_MayCompleteScope=1
"let OmniCpp_SelectFirstItem=2
"set completeopt=menuone,preview,longest

" spell settings
let g:lmap.s = { 'name' : 'Spellcheck' }
noremap <Leader>se :setlocal spell spelllang=en_gb<CR>
noremap <Leader>sf :setlocal spell spelllang=fi_fi<CR>
noremap <Leader>sn :setlocal nospell<CR>

if !exists("g:disable_fugitive")
  let g:lmap.g = { 'name' : 'Fugitive' }
  " Fugitive options
  noremap <Leader>gw :Gwrite<CR>
  noremap <Leader>gs :Gstatus<CR>
  noremap <Leader>gc :Gcommit -v<CR>
  noremap <Leader>gd :Gdiff<CR>
  noremap <Leader>gD :Gdiff!<CR>
  noremap <leader>gb :Gblame<cr>
  " blame by lines
  vnoremap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>
endif

" NERDComment
let g:lmap.c = { 'name' : 'Comments' }
" Remap VCSCommand commands because nerdcomment uses <Leader>c
let g:VCSCommandMapPrefix='<Leader>k'

" by default fold by indent
set foldmethod=indent
set foldlevelstart=999

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.email setlocal filetype=mail
  autocmd BufNewFile,BufRead Gemfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead Guardfile setlocal filetype=ruby
  autocmd BufNewFile,BufRead *.qml setlocal filetype=qml
  autocmd BufNewFile,BufRead *.handlebars setlocal filetype=html
  "autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType text setlocal colorcolumn=80 wrap
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup focuscmds
  autocmd!
  autocmd FocusLost * :set number
  autocmd FocusGained * :set relativenumber
augroup END

augroup BWCCreateDir
	au!
	autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p %:h" | redraw! | endif
augroup END

augroup rainbow
  au!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
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

"set background=light " do I want to do this? dunno.

" NOW SERIOUSLY
set nobackup
set nowritebackup

" Tabularize
if exists(":Tabularize")
  let g:lmap.a = { 'name' : 'Tabularize' }
  nnoremap <leader>a\| :Tabularize /\|<CR>
  vnoremap <leader>a\| :Tabularize /\|<CR>
  nnoremap <leader>a= :Tabularize /=<CR>
  vnoremap <leader>a= :Tabularize /=<CR>
  nnoremap <leader>a: :Tabularize /:\zs<CR>
  vnoremap <leader>a: :Tabularize /:\zs<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

" Map Ctrl-i to Ctrl-] because the latter is apparently impossible to
" type on a mac with a keyboard that requires alt for ].
noremap <C-i> <C-]>

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" error format for sbt-quickfix plugin
" (https://github.com/dscleaver/sbt-quickfix)
set errorformat=%E\ %#[error]\ %#%f:%l:\ %m,%-Z\ %#[error]\ %p^,%-C\ %#[error]\ %m
set errorformat+=,%W\ %#[warn]\ %#%f:%l:\ %m,%-Z\ %#[warn]\ %p^,%-C\ %#[warn]\ %m
set errorformat+=,%-G%.%#

" --- start of neocomplcache setting block

""  "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Enable heavy features.
"" Use camel case completion.
""let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
""let g:neocomplcache_enable_underbar_completion = 1
"
"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }
"
"" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
"    let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
""inoremap <expr><C-g>     neocomplcache#undo_completion()
""inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
"  return neocomplcache#smart_close_popup() . "\<CR>"
"  " For no inserting <CR> key.
"  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"endfunction
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"" Close popup by <Space>.
""inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
"
"" For cursor moving in insert mode(Not recommended)
""inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
""inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
""inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
""inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"" Or set this.
""let g:neocomplcache_enable_cursor_hold_i = 1
"" Or set this.
""let g:neocomplcache_enable_insert_char_pre = 1
"
"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"" Enable omni completion.
"augroup omnifuncs
"  autocmd!
"  "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"  "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup END
"
"" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"" For perlomni.vim setting.
"" https://github.com/c9s/perlomni.vim
"let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" --- end neocomplcache setting block

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dotfiles = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_arg_map = 1

let g:lmap.p = { 'name' : 'Ctrl-P' }
nnoremap <leader>pp :CtrlPMenu<cr>
nnoremap <leader>pf :CtrlP<cr>
nnoremap <leader>py :CtrlPYankRing<cr>
nnoremap <leader>pr :CtrlPMRUFiles<cr>
"nnoremap <leader>pt :CtrlPTag<cr>
nnoremap <leader>pt :CtrlPBufTag<cr>
nnoremap <leader>pb :CtrlPBuffer<cr>
nnoremap <Leader>pu :CtrlPFunky<cr>
" narrow the list down with a word under cursor
nnoremap <Leader>pU :execute 'CtrlPFunky ' . expand('<cword>')<cr>
map <Leader>pm :CtrlPModified<CR>
map <Leader>pM :CtrlPBranch<CR>
map <Leader>pd :CtrlPDir<CR>
nnoremap <Leader>pc :CtrlPClearCache<cr>
nnoremap <Leader>pC :CtrlPClearAllCaches<cr>

nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
"nnoremap <tab> :CtrlPtjump<cr>
"vnoremap <tab> :CtrlPtjumpVisual<cr>

" flake8
let g:flake8_show_in_file=1
augroup flake8
  autocmd!
  autocmd BufWritePost *.py call Flake8()
augroup END

" yapf
augroup yapf
  autocmd!
  autocmd FileType python nnoremap <leader>Y :0,$!yapf<cr>
  autocmd FileType python setlocal formatprg=yapf
augroup END

" elm
augroup elm
  autocmd!
  let g:lmap.e = { 'name' : 'Elm' }
  au FileType elm nmap <leader>eb <Plug>(elm-make)
  au FileType elm nmap <leader>em <Plug>(elm-make-main)
  au FileType elm nmap <leader>et <Plug>(elm-test)
  au FileType elm nmap <leader>er <Plug>(elm-repl)
  au FileType elm nmap <leader>ee <Plug>(elm-error-detail)
  au FileType elm nmap <leader>ed <Plug>(elm-show-docs)
  au FileType elm nmap <leader>eD <Plug>(elm-browse-docs)
  au FileType elm nmap <leader>ef :ElmFormat<cr>
  au FileType elm setlocal formatprg=elm-format
augroup END
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1

"nnoremap <leader>el :ElmEvalLine<CR>
"vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
"nnoremap <leader>em :ElmMakeCurrentFile<CR>

" gitgutter
let g:lmap.h = {'name' : 'GitGutter'}
nnoremap <leader>hn :GitGutterNextHunk<cr>
nnoremap <leader>hp :GitGutterPreviousHunk<cr>
nnoremap <leader>hv :GitGutterPreviewHunk<cr>
nnoremap <leader>hf gg:GitGutterNextHunk<cr>
let g:lmap.h.f = ['', 'First Hunk']

" All maps have names, can go ahead and finish up leader guide registration
" (ok so maybe they would update dynamically but mehhh)
call leaderGuide#register_prefix_descriptions(",", "g:lmap")
nnoremap <silent> <leader> :LeaderGuide ','<CR>
vnoremap <silent> <leader> :LeaderGuideVisual ','<CR>


" local defs, LEAVE THIS LAST
if filereadable($HOME."/.vimrc-local")
	so $HOME/.vimrc-local
endif
