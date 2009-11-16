if v:progname != 'gvim'
  set background=dark
endif
filetype plugin on
filetype indent on
"set guifont=Envy\ Code\ R\ 10
colorscheme zenburn
set backspace=2
set ruler
set modeline
set incsearch
set hlsearch
set wildmenu
set number
set scrolloff=2
set cinoptions=(0

map <C-F11> :!ctags -a -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

nnoremap <silent> <F8> :TlistToggle<CR>
let g:Tlist_Show_Menu=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Show_One_File=1

let OmniCpp_MayCompleteScope=1
let OmniCpp_SelectFirstItem=2
set completeopt=menuone

map <Leader>se :setlocal spell spelllang=en_gb<CR>
map <Leader>sf :setlocal spell spelllang=fi_fi<CR>
map <Leader>sn :setlocal nospell<CR>

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd FileType python setlocal sw=4 sts=4 et
  autocmd FileType ruby,eruby,yaml setlocal sw=2 sts=2 et
  autocmd FileType html,xhtml setlocal sw=2 sts=2 et
  autocmd FileType cpp setlocal sw=4 sts=4 et
  " define autocommands here
endif

" this is for waf builds
let &efm = "%-GBuild finished successfully %.%#," . &efm

