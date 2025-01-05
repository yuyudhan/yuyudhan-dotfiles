-- nvim/lua/yuyudhan/plugins.lua

-- Ensure packer is installed
local ensure_packer = function()
    local fn = vim.fn
    File: ~/.config/nvim/local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Use packer to manage plugins
return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Core functionalities
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Treesitter for better syntax highlighting
    use 'neovim/nvim-lspconfig' -- LSP support
    use 'hrsh7th/nvim-cmp' -- Autocompletion framework
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets support

    -- File explorers
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- Optional: for file icons
        },
        config = function()
            require('plugin-config.nvim-tree') -- Load the nvim-tree configuration
        end
    }
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",          -- Required dependency
            "nvim-tree/nvim-web-devicons",   -- Optional for file icons
            "MunifTanjim/nui.nvim",          -- Required dependency
        }
    }

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- Fuzzy finder
    use { 'junegunn/fzf', run = './install --bin' }
    use 'junegunn/fzf.vim'

    -- Terminal integration
    use {
        'akinsho/toggleterm.nvim',
        config = function()
            require('plugin-config.toggleterm') -- Load the toggleterm configuration
        end
    }

    -- Yazi integration with Neovim
    use {
        'mikavilpas/yazi.nvim',
        config = function()
            require('plugin-config.yazi') -- Load the Yazi configuration
        end
    }

    -- Git integration
    use 'kdheepak/lazygit.nvim'

    -- Scrolling
    use 'karb94/neoscroll.nvim'

    -- Keybinding helper
    use 'folke/which-key.nvim'

    -- Commenting utility
    use 'numToStr/Comment.nvim'

    -- Automatically set up your configuration if packer_bootstrap is true
    if packer_bootstrap then
        require('packer').sync()
    end
end)

