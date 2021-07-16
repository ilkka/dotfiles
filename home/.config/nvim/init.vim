let completeopt = 'menuone,noselect'
" todo: make this better somehow
" needs to be not a symlink tho, or at least :checkhealth on windows fails otherwise :(
let g:python3_host_prog = 'C:/Program Files/WindowsApps/PythonSoftwareFoundation.Python.3.9_3.9.1776.0_x64__qbz5n2kfra8p0/python3.9.exe'
let mapleader = ","

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
