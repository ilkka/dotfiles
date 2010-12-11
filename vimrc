" call pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

if $TERM=='xterm-256color' || v:progname=='gvim'
	colorscheme inkpot
else
	colorscheme default
endif

syntax enable

if has("macunix")
	set guifont=Monaco:h12
end

set backspace=2
set ruler
set modeline
set incsearch
set hlsearch
set wildmenu
set scrolloff=2
set cinoptions=(0

map <C-F11> :!ctags -a -R --c++-kinds=+p --fields=+iaS --extra=+q . /usr/include<CR>

nnoremap <silent> <F8> :TlistToggle<CR>
let g:Tlist_Show_Menu=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Show_One_File=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Close_On_Select=1

nnoremap <silent> <F7> :NERDTreeToggle<CR>

let OmniCpp_MayCompleteScope=1
let OmniCpp_SelectFirstItem=2
set completeopt=menuone,preview,longest

map <Leader>se :setlocal spell spelllang=en_gb<CR>
map <Leader>sf :setlocal spell spelllang=fi_fi<CR>
map <Leader>sn :setlocal nospell<CR>

map <Leader>ff :FufFile<CR>
map <Leader>fb :FufBuffer<CR>
map <Leader>fd :FufDir<CR>

let g:alternateExtensions_CC = "hh"
let g:alternateExtensions_HH = "cc"

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  " define autocommands here
  autocmd FileType python setlocal sw=4 sts=4 et
  autocmd FileType python compiler pyunit
  autocmd FileType python setlocal makeprg=${VIMHOME}/extras/run_all_python_tests_recursively.py
  autocmd FileType ruby,eruby,yaml setlocal sw=2 sts=2 et
  autocmd FileType html,xhtml setlocal sw=2 sts=2 et
  autocmd FileType cpp setlocal sw=4 sts=4 et
  autocmd FileType php setlocal sw=2 sts=2 et
  autocmd FileType xml setlocal sw=2 sts=2 et
  autocmd FileType docbk setlocal sw=2 sts=2 et
  autocmd FileType mail,markdown,rst setlocal textwidth=78
endif

" this is for waf builds
let &efm = "%-GBuild finished successfully %.%#," . &efm

" for rsense
let g:rsenseHome = $RSENSE_HOME

" for trac
let g:tracServerList = {}

" local defs, LEAVE THIS LAST
if filereadable($HOME."/.vimrc-local")
	so $HOME/.vimrc-local
endif

