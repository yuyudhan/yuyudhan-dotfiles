--  FilePath: nvim/lua/config/lazy.lua

-- Bootstrap lazy.nvim plugin manager if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Path where lazy.nvim will be installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then -- Check if lazy.nvim is already installed
    local lazyrepo = "https://github.com/folke/lazy.nvim.git" -- Official lazy.nvim repository
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then -- Check if git clone failed
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath) -- Add lazy.nvim to runtime path so it can be required

-- Configure lazy.nvim plugin manager with LazyVim integration
require("lazy").setup({
    spec = {
        -- Import LazyVim base configuration and its default plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- Import LazyVim extras for enhanced productivity
        { import = "lazyvim.plugins.extras.editor.telescope" },
        -- { import = "lazyvim.plugins.extras.editor.leap" }, -- Disabled: conflicts with Flash.nvim
        { import = "lazyvim.plugins.extras.coding.yanky" },
        { import = "lazyvim.plugins.extras.ui.mini-animate" },
        -- Import your custom plugins from lua/plugins/ directory
        { import = "plugins" },
    },
    defaults = {
        -- Plugin loading behavior - set to false for immediate loading
        -- Setting lazy = true would defer loading until plugins are actually needed
        lazy = false,
        -- Version management - use latest git commits instead of releases
        -- Many plugins have outdated releases, so git HEAD is often more stable
        version = false, -- always use the latest git commit
        -- version = "*", -- alternative: try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } }, -- Fallback colorschemes during installation
    checker = {
        enabled = true, -- automatically check for plugin updates periodically
        notify = false, -- don't show notifications when updates are found
    },
    performance = {
        rtp = {
            -- Disable built-in Neovim plugins that are not needed to improve startup time
            disabled_plugins = {
                "gzip", -- Disable gzip file handling
                -- "matchit",     -- Keep matchit for better % matching
                -- "matchparen",  -- Keep matchparen for bracket highlighting
                -- "netrwPlugin", -- Keep netrw disabled (we use neo-tree)
                "tarPlugin", -- Disable tar file handling
                "tohtml", -- Disable :TOhtml command
                "tutor", -- Disable :Tutor command
                "zipPlugin", -- Disable zip file handling
            },
        },
    },
})

