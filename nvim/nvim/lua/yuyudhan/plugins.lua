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

