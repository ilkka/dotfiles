" For tips on lua conversion see https://oroques.dev/notes/neovim-init/ and
" https://github.com/mjlbach/defaults.nvim/blob/master/init.lua

" courtesy of https://vi.stackexchange.com/a/2577
if !exists('g:os')
    if has('win32')
        let g:os = 'Windows'
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

let completeopt = 'menuone,noselect'

if g:os == 'Windows'
    " todo: make this better somehow
    " needs to be not a symlink tho, or at least :checkhealth on windows fails otherwise :(
    let g:python3_host_prog = 'C:/Program Files/WindowsApps/PythonSoftwareFoundation.Python.3.9_3.9.1776.0_x64__qbz5n2kfra8p0/python3.9.exe'
endif

let mapleader = ","

if g:os == 'Windows'
    " put all those scoop apps on the path
    " when started from the start menu, the scoop version of gui neovim does not
    " have any of the shims on path
    let $PATH .= ';c:/users/ilkka/scoop/shims'
endif

" bootstrap packer
lua << EOF
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end
EOF

lua require('plugins')
