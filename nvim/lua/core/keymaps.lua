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
keymap("n", "<leader>rr", ':lua require("utils.helpers").reload_config()<CR>', opts)

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
vim.keymap.set("n", "<leader>ee", ":NeoTreeFloatToggle<CR>", { noremap = true, silent = true }) -- Toggle floating file explorer
vim.keymap.set("n", "<leader>er", ":NeoTreeReveal<CR>", { noremap = true, silent = true }) -- Reveal current file
vim.keymap.set("n", "<leader>ef", ":NeoTreeFocus<CR>", { noremap = true, silent = true }) -- Focus on file explorer

-- Telescope Keybindings
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true }) -- Find files
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true }) -- Search text in files
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true }) -- List open buffers
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true }) -- Search help tags
vim.keymap.set("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true }) -- Search symbols in current file
vim.keymap.set("n", "<leader>fw", ":Telescope lsp_workspace_symbols<CR>", { noremap = true, silent = true }) -- Search symbols in workspace
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { noremap = true, silent = true }) -- Find recently opened files
vim.keymap.set("n", "<leader>fc", ":Telescope commands<CR>", { noremap = true, silent = true }) -- List available commands

-- Lazygit Integration
keymap("n", "<leader>lg", ":LazyGit<CR>", opts)

-- Packer Plugin Manager
vim.keymap.set("n", "<leader>pss", ":PackerSync<CR>", opts)  -- Sync plugins
vim.keymap.set("n", "<leader>pst", ":PackerStatus<CR>", opts) -- Check status
vim.keymap.set("n", "<leader>psc", ":PackerClean<CR>", opts)  -- Clean unused plugins

-- Toggleterm
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { noremap = true, silent = true })

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

-- Resize splits with <leader> and arrow keys (step size: 5)
vim.api.nvim_set_keymap("n", "<leader>r<Up>", ":resize +10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r<Down>", ":resize -10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r<Left>", ":vertical resize -10<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r<Right>", ":vertical resize +10<CR>", { noremap = true, silent = true })

-- ========================= ==============
-- Keymap Extensions Placeholder
-- ========================================
-- Add new keymaps here in a structured manner


-- Plugin-specific keymaps
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- File explorer
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true }) -- Find files
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true }) -- Live grep
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true }) -- Buffers
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true }) -- Help tags
vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>", { noremap = true, silent = true }) -- Terminal

