return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'hrsh7th/nvim-compe',
        config = function ()
            require('compe').setup {
                source = {
                    path = true,
                    buffer = true,
                    calc = true,
                    nvim_lsp = true,
                    -- nvim_lua = true,
                    vsnip = true,
                    -- ultisnips = true,
                    -- luasnip = true,
                    neorg = true,
                    treesitter = true,
                }
            }
            vim.api.nvim_set_keymap('i', '<C-Space>', [[compe#complete()]], { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm('<CR>')]], { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<C-e>', [[compe#close('<C-e>')]], { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<C-f>', [[compe#scroll({ 'delta': +4 })]], { noremap = true, expr = true })
            vim.api.nvim_set_keymap('i', '<C-d>', [[compe#scroll({ 'delta': -4 })]], { noremap = true, expr = true })
        end
    }

    use {
        'vhyrro/neorg',
        config = function ()
            require('neorg').setup {
                load = {
                    ['core.defaults'] = {},
                    ['core.keybinds'] = {
                        config = {
                            default_keybinds = true,
                            neorg_leader = "<Leader>o"
                        }
                    },
                    ['core.norg.concealer'] = {},
                    ['core.norg.dirman'] = {
                        config = {
                            workspaces = {
                                onedrive = "~/OneDrive/Documents/neorg"
                            }
                        }
                    }
                },

                logger = {
                    level = 'warn'
                }
            }
        end,
        requires = {
            'nvim-lua/plenary.nvim',
            'hrsh7th/nvim-compe'
        }
    }

    use { 
        'Shougo/defx.nvim',
        config = function()
            vim.api.nvim_command('autocmd FileType defx call defx_settings#keybinds()')
            -- vim.api.nvim_command("noremap <silent> <F3> :Defx -split=vertical -winwidth=50 -direction=topleft -search=`expand('%:p')` `expand('%:p:h')`<CR>")
            vim.api.nvim_set_keymap('n', "<F3>", "<Cmd>Defx -search=`expand('%:p')` `expand('%:p:h')`<CR>", { noremap = true, silent = true })
            vim.api.nvim_command("call defx#custom#option('_', {'columns':'mark:indent:icon:filename:git:type:size:time'})")
        end
    }

    use {
        'preservim/tagbar',
        config = function()
            vim.api.nvim_set_keymap('n', '<F2>', [[<Cmd>TagbarToggle<CR>]], { noremap = true, silent = true })
        end
    }

    use {
        'preservim/nerdcommenter',
        config = function()
            vim.g.NERDCreateDefaultMappings = 1
            vim.g.NERDSpaceDelims = 1
            vim.g.NERDCommentEmptyLines = 1
            vim.g.NERDTrimTrailingWhitespace = 1
        end
    }

    use 'easymotion/vim-easymotion'

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require('statusline') end,
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'marko-cerovac/material.nvim',
        config = function()
            require('material').set()
            vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
        end
    }

    use {
        'romgrk/barbar.nvim',
        config = function()
            vim.api.nvim_set_keymap('n', '<A-,>', [[<Cmd>BufferPrevious<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-.>', [[<Cmd>BufferNext<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-A-,>', [[<Cmd>BufferMovePrevious<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-A-.>', [[<Cmd>BufferMoveNext<CR>]], { noremap = true, silent = true })

            vim.api.nvim_set_keymap('n', '<A-1>', [[<Cmd>BufferGoto 1<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-2>', [[<Cmd>BufferGoto 2<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-3>', [[<Cmd>BufferGoto 3<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-4>', [[<Cmd>BufferGoto 4<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-5>', [[<Cmd>BufferGoto 5<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-6>', [[<Cmd>BufferGoto 6<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-7>', [[<Cmd>BufferGoto 7<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-8>', [[<Cmd>BufferGoto 8<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<A-9>', [[<Cmd>BufferGoto 9<CR>]], { noremap = true, silent = true })

            vim.api.nvim_set_keymap('n', '<A-c>', [[<Cmd>BufferClose<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<C-s>', [[<Cmd>BufferPick<CR>]], { noremap = true, silent = true })
        end,
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup {
            }
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            vim.api.nvim_set_keymap('n', '<Leader>ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>fF', [[<Cmd>Telescope git_files<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>fb', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
        end,
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'sharkdp/bat'},
            {'sharkdp/fd'},
            {'BurntSushi/ripgrep'},
            {'nvim-treesitter/nvim-treesitter'},
            {'kyazdani42/nvim-web-devicons'},
        }
    }

    use {
        'lambdalisue/gina.vim',
        config = function()
            vim.api.nvim_set_keymap('n', '<Leader>gs', [[<Cmd>Gina status<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gS', [[<Cmd>Gina add %<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gU', [[<Cmd>Gina reset -q %<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gc', [[<Cmd>Gina commit --verbose --restore<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gP', [[<Cmd>Gina push<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gp', [[<Cmd>Gina patch %<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gd', [[<Cmd>Gina diff<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>ga', [[<Cmd>Gina add %<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gA', [[<Cmd>Gina add .<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gb', [[<Cmd>Gina blame<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gV', [[<Cmd>Gina log %<CR>]], { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', '<Leader>gv', [[<Cmd>Gina log<CR>]], { noremap = true, silent = true })
        end
    }

    use {
        "mhinz/vim-signify"
    }

    use 'mg979/vim-visual-multi'

    use {
        'hrsh7th/vim-vsnip',
        config = function()
            vim.api.nvim_set_keymap('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], { expr = true })
            vim.api.nvim_set_keymap('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']], { expr = true })
            vim.api.nvim_set_keymap('i', '<C-l>', [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], { expr = true })
            vim.api.nvim_set_keymap('s', '<C-l>', [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']], { expr = true })

            vim.api.nvim_set_keymap('i', '<Tab>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']], { expr = true })
            vim.api.nvim_set_keymap('s', '<Tab>', [[vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']], { expr = true })
            vim.api.nvim_set_keymap('i', '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']], { expr = true })
            vim.api.nvim_set_keymap('s', '<S-Tab>', [[vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']], { expr = true })

            vim.api.nvim_set_keymap('n', 's', [[<Plug>(vsnip-select-text)]], {})
            vim.api.nvim_set_keymap('x', 's', [[<Plug>(vsnip-select-text)]], {})
            vim.api.nvim_set_keymap('n', 'S', [[<Plug>(vsnip-cut-text)]], {})
            vim.api.nvim_set_keymap('x', 'S', [[<Plug>(vsnip-cut-text)]], {})
        end,
        requires = {
            "hrsh7th/vim-vsnip-integ"
        }
    }

    use 'rafamadriz/friendly-snippets'

    use { 'elixir-editors/vim-elixir' }

    use {
        'neovim/nvim-lspconfig',
        config = function()
            local nvim_lsp = require('lspconfig')

            -- Use an on_attach function to only map the following keys
            -- after the language server attaches to the current buffer
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                --Enable completion triggered by <c-x><c-o>
                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Mappings.
                local opts = { noremap=true, silent=true }

                -- See `:help vim.lsp.*` for documentation on any of the below functions
                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
                buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
                buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
                buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
                buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
                buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
                buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

            end

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            -- Use a loop to conveniently call 'setup' on multiple servers and
            -- map buffer local keybindings when the language server attaches
            local servers = { "tsserver", "terraformls", "pylsp", "vimls" }
            for _, lsp in ipairs(servers) do
                nvim_lsp[lsp].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    flags = {
                        debounce_text_changes = 150,
                    }
                }
            end

            -- servers needing custom config:
            nvim_lsp["jsonls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                cmd = { "vscode-json-language-server.cmd", "--stdio" }
            }

            nvim_lsp["html"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                cmd = { "vscode-html-language-server.cmd", "--stdio" }
            }

            nvim_lsp["yamlls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                cmd = { "yaml-language-server.cmd", "--stdio" }
            }

            nvim_lsp["dockerls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                cmd = { "docker-langserver.cmd", "--stdio" }
            }

            nvim_lsp["elixirls"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                cmd = { "c:/users/ilkka/code/elixir-ls/rel/language_server.bat" }
            }

            nvim_lsp["powershell_es"].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                bundle_path = "c:/Users/ilkka/scoop/apps/powershell-editor-services/current"
            }

            local runtime_path = vim.split(package.path, ';')
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")

            nvim_lsp["sumneko_lua"].setup {
                cmd = { "c:/Users/ilkka/Code/lua-language-server/bin/Windows/lua-language-server.exe", "-E", "c:/Users/ilkka/Code/lua-language-server/main.lua" };
                on_attach = on_attach,
                capabilities = capabilities,
                flags = {
                    debounce_text_changes = 150
                },
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                            path = runtime_path
                        },
                        diagnostics = {
                            globals = {'vim'}
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true)
                        },
                        telemetry = {
                            enable = false
                        }
                    }
                }
            }

            nvim_lsp["omnisharp"].setup {
                cmd = { "c:/users/ilkka/scoop/apps/omnisharp/current/omnisharp.exe", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
            }

            vim.api.nvim_command('autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp')

            nvim_lsp["fsautocomplete"].setup {
                cmd = { "dotnet", "fsautocomplete", "--background-service-enabled" },
            }

            nvim_lsp["efm"].setup {
                init_options = { documentFormatting = true, hover = true, documentSymbol = true, codeAction = true, completion = true },
                capabilities = capabilities,
                on_attach = on_attach,
                flags = {
                    debounce_text_changes = 150
                },
                filetypes = { "elixir" }
            }
        end
    }

    use 'adelarsq/neofsharp.vim'

    use 'leafgarland/typescript-vim'
    use 'peitalin/vim-jsx-typescript'
    use 'heavenshell/vim-jsdoc'

    use 'editorconfig/editorconfig-vim'

    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    require('nvim-treesitter.configs').setup {
        ensure_installed = 'maintained',
        highlight = {
            enable = true
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = 'grn',
                scope_incremental = 'grc',
                node_decremental = 'grm',
            },
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
        },
    }

    use 'blackCauldron7/surround.nvim'

    use 'tpope/vim-dadbod'

    use 'lukas-reineke/indent-blankline.nvim'
end)

