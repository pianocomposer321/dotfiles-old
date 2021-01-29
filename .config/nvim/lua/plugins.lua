local cmd = vim.cmd
local g = vim.g
local map = require("funcs").map

cmd [[packadd packer.nvim]]

local plugins = require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use '~/vim-plugins/yabs'
    
    use {"gruvbox-community/gruvbox"}

    use {
        "neovim/nvim-lspconfig",
        config = function() require("plugin_config/lspconfig").config() end
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true
                }
            }
        end
    }
    use "nvim-lua/completion-nvim"
    use {"aca/completion-tabnine", run = "./install.sh"}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function() require("plugin_config/telescope").config() end
    }

    use "jiangmiao/auto-pairs"
    use 'haya14busa/is.vim'

    use 'jremmen/vim-ripgrep'
    use 'stefandtw/quickfix-reflector.vim'

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-endwise'

    use {
        'christoomey/vim-tmux-navigator',
        config = function() require("plugin_config/tmuxnavigator").config() end
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        -- config = function()
        --     local lualine = require('lualine')
        --     lualine.status()
        -- end
        config = function() require("plugin_config/lualine").config() end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require("plugin_config/nvimtree").config() end
    }
    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    -- use 'akinsho/nvim-toggleterm.lua'
    use {
        'voldikss/vim-floaterm',
        config = function() require("plugin_config/floaterm").config() end
    }
end)

-- require"toggleterm".setup{
--   size = 12,
--   open_mapping = [[<C-\>]],
--   shade_filetypes = {},
--   shade_terminals = true,
--   persist_size = true,
--   direction = 'horizontal'
-- }

cmd("colorscheme gruvbox")
require("plugin_config")
require("bufferline").setup{options = {view = "multiwindow"}}


return plugins
