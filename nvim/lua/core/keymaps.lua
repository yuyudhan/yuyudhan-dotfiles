-- nvim/lua/core/keymaps.lua

-- Set Space as the leader key
vim.g.mapleader = " "

-- Shorten function name for convenience
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ========================================
-- General Keymaps
-- ========================================
keymap("n", "<leader>w", ":w<CR>", opts)      -- Save file
keymap("n", "<leader>q", ":q<CR>", opts)      -- Quit Neovim
keymap("n", "<leader>x", ":bdelete<CR>", opts) -- Close buffer

-- Copy to system clipboard in visual mode
keymap("v", "<C-c>", '"+y', opts)

-- Reload Neovim configuration
keymap("n", "<leader>rr", ':lua require("yuyudhan.reload").reload_config()<CR>', opts)

-- Close all buffers except current
keymap("n", "<leader>Q", ":lua CloseAllExceptCurrent()<CR>", opts)

-- ========================================
-- Navigation Keymaps
-- ========================================
-- Window navigation
keymap("n", "<leader>wh", "<C-w>h", opts) -- Move to left window
keymap("n", "<leader>wj", "<C-w>j", opts) -- Move to bottom window
keymap("n", "<leader>wk", "<C-w>k", opts) -- Move to top window
keymap("n", "<leader>wl", "<C-w>l", opts) -- Move to right window

-- ========================================
-- Plugin-Specific Keymaps
-- ========================================

-- File Explorer: NeoTree
vim.keymap.set("n", "<leader>e", ":NeoTreeShowToggle<CR>", { noremap = true, silent = true })

-- Lazygit Integration
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)

-- Packer Plugin Manager
vim.keymap.set("n", "<leader>pss", ":PackerSync<CR>", opts)  -- Sync plugins
vim.keymap.set("n", "<leader>pst", ":PackerStatus<CR>", opts) -- Check status
vim.keymap.set("n", "<leader>psc", ":PackerClean<CR>", opts)  -- Clean unused plugins

-- ========================================
-- Fuzzy Finder: fzf.vim
-- ========================================
keymap("n", "<C-p>", ":Files<CR>", opts)       -- Open file search
keymap("n", "<leader>pp", ":Files<CR>", opts) -- Project files search
keymap("n", "<leader>ff", ":Files<CR>", opts) -- Files search
keymap("n", "<leader>b", ":Buffers<CR>", opts) -- List open buffers
keymap("n", "<leader>r", ":Rg<CR>", opts)      -- Search with ripgrep

-- ========================================
-- Additional Utilities
-- ========================================

-- Convert selection to uppercase
vim.api.nvim_set_keymap("n", "<leader>U", ":lua UpperCase()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>U", ":lua UpperCase()<CR>", opts)

-- Convert selection to lowercase
vim.api.nvim_set_keymap("n", "<leader>L", ":lua LowerCase()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>L", ":lua LowerCase()<CR>", opts)

-- Sort lines in selection
vim.api.nvim_set_keymap("n", "<leader>S", ":lua SortLines()<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>S", ":lua SortLines()<CR>", opts)

-- ========================================
-- Keymap Extensions Placeholder
-- ========================================
-- Add new keymaps here in a structured manner

