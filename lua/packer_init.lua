-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim
-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
                                  install_path})
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup(function(use)
    -- Add you plugins here:
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- Tokyo night
    use 'folke/tokyonight.nvim'

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end
    }

    use {
        "terrortylor/nvim-comment",
        run = function()
            require('nvim_comment').setup()
        end

    }

    use {
        "windwp/nvim-autopairs",

        config = [[require("completion.autopairs")()]]

    }

    -- golang
    use({
        "ray-x/go.nvim",
        ft = "go",
        config = [[require("languages.go")()]]
    })

    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        run = function()
            require'nvim-treesitter.configs'.setup {
                context_commentstring = {
                    enable = true
                }
            }
        end

    }

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        requires = {"jose-elias-alvarez/null-ls.nvim", "hrsh7th/cmp-nvim-lsp"},
        config = [[require("lsp")()]]
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer',
                    'saadparwaiz1/cmp_luasnip'},
        config = [[require("completion.snippet")()]]
    }

    -- Statusline
    use {
        'feline-nvim/feline.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- git labels
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('gitsigns').setup {}
        end
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
