-- nvim/lua/yuyudhan/plugins.lua

-- Ensure Packer is installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            "git",
            "clone",
            "--depth",
            "1",
            "https://github.com/wbthomason/packer.nvim",
            install_path,
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Plugin management with Packer
return require("packer").startup(function(use)

    -- ========================================
    -- Package management
    -- ========================================

    -- Packer manages itself
    use("wbthomason/packer.nvim")

    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }


    -- ========================================
    -- Core Functionalities
    -- ========================================
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }) -- Treesitter for better syntax highlighting
    use("neovim/nvim-lspconfig") -- LSP support
    use("hrsh7th/nvim-cmp") -- Autocompletion framework
    use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
    use("L3MON4D3/LuaSnip") -- Snippets support

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }


    -- ========================================
    -- File Explorers
    -- ========================================
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- Optional: for file icons
        },
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", -- Required dependency
            "nvim-tree/nvim-web-devicons", -- Optional for file icons
            "MunifTanjim/nui.nvim", -- Required dependency
        },
    })

    -- ========================================
    -- Statusline
    -- ========================================
    use("nvim-lualine/lualine.nvim")

    -- ========================================
    -- Fuzzy Finder
    -- ========================================
    use({
        "junegunn/fzf",
        run = "./install --bin",
    })
    use("junegunn/fzf.vim")

    -- ========================================
    -- Terminal Integration
    -- ========================================
    use({
        "akinsho/toggleterm.nvim",
    })

    -- ========================================
    -- Git Integration
    -- ========================================
    use("kdheepak/lazygit.nvim")

    -- ========================================
    -- Utilities
    -- ========================================
    use("karb94/neoscroll.nvim") -- Smooth scrolling
    use("folke/which-key.nvim") -- Keybinding helper
    use("numToStr/Comment.nvim") -- Commenting utility

    -- ========================================
    -- Automatically set up configuration
    -- ========================================
    if packer_bootstrap then
        require("packer").sync()
    end

end)

