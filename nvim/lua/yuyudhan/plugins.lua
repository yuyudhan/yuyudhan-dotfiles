-- nvim/nvim/lua/yuyudhan/plugins.lua

-- Ensure packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
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
    -- Plugin manager
    use 'wbthomason/packer.nvim'
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- LSP and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- FZF and FZF.vim
    use { 'junegunn/fzf', run = './install --bin' }
    use 'junegunn/fzf.vim'

    -- Which-Key
    use 'folke/which-key.nvim'

    use 'karb94/neoscroll.nvim'

    use 'numToStr/Comment.nvim'

    -- Lazygit
    use 'kdheepak/lazygit.nvim'



    -- LSP and autocompletion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Statusline
    use 'nvim-lualine/lualine.nvim'

    -- FZF and FZF.vim
    use { 'junegunn/fzf', run = './install --bin' }
    use 'junegunn/fzf.vim'

    -- Which-Key
    use 'folke/which-key.nvim'

    use 'karb94/neoscroll.nvim'

    use 'numToStr/Comment.nvim'

    -- Lazygit
    use 'kdheepak/lazygit.nvim'


    -- Show hidden files in nvim tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require('nvim-tree').setup({
                -- Enable showing hidden files
                filters = {
                    dotfiles = false,
                },
                -- Additional configurations can go here
            })
        end
    }

  
    -- Function to toggle hidden files in nvim-tree
    local ToggleHidden = function()
        local nvim_tree = require('nvim-tree')
        local config = require('nvim-tree.config')
        local view = require('nvim-tree.view')
        local current = nvim_tree.config.view.side

        -- Toggle the `dotfiles` filter
        local filters = require('nvim-tree.config').view.mappings.list
        local setup = require('nvim-tree').setup
        -- Unfortunately, nvim-tree.lua does not provide a direct toggle function for dotfiles.
        -- A workaround is to reload nvim-tree with updated settings.
        local current_filters = require('nvim-tree').get_config().filters
        current_filters.dotfiles = not current_filters.dotfiles
        require('nvim-tree').setup({ filters = current_filters })
        require('nvim-tree').refresh()
    end

    -- Keybinding (optional)
    vim.api.nvim_set_keymap('n', '<leader>H', ':lua ToggleHidden()<CR>', { noremap = true, silent = true })

 use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",          -- Required dependency
            "nvim-tree/nvim-web-devicons",   -- Optional for file icons
            "MunifTanjim/nui.nvim",          -- Required dependency
        }
    }

    -- Automatically set up your configuration if packer_bootstrap is true
    if packer_bootstrap then
        require('packer').sync()
    end
end)

