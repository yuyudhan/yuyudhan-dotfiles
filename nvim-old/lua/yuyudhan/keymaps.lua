-- nvim/nvim/lua/yuyudhan/ eymaps.lua

-- Set Space as the leader key
vim.g.mapleader = " "

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General keymaps
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>x', ':bdelete<CR>', opts)

-- Nvim-Tree
keymap('n', '<leader>e', ':NvfimTreeToggle<CR>', opts)

-- Fuzzy finder using fzf
keymap('n', '<C-p>', ':Files<CR>', opts)
keymap('n', '<leader>pp', ':Files<CR>', opts)
keymap('n', '<leader>ff', ':Files<CR>', opts)
keymap('n', '<leader>b', ':Buffers<CR>', opts)
keymap('n', '<leader>r', ':Rg<CR>', opts)

-- Leader mappings for window navigation
keymap('n', '<leader>wh', '<C-w>h', opts)
keymap('n', '<leader>wj', '<C-w>j', opts)
keymap('n', '<leader>wk', '<C-w>k', opts)
keymap('n', '<leader>wl', '<C-w>l', opts)

-- Set Ctrl+C to copy to the system clipboard in visual mode
keymap('v', '<C-c>', '"+y', opts)

-- Open Lazygit in a floating window
keymap('n', '<leader>lg', ':LazyGit<CR>', opts)

-- Reload the nvim configurations
keymap('n', '<leader>rr', ':lua require("yuyudhan.reload").reload_config()<CR>', opts)

-- Configuration to show the neotree
vim.keymap.set("n", "<leader>e", ":NeoTreeShowToggle<CR>", { noremap = true, silent = true })

-- Packer keybindings
vim.keymap.set("n", "<leader>pss", ":PackerSync<CR>", { noremap = true, silent = true })  -- Sync
vim.keymap.set("n", "<leader>pst", ":PackerStatus<CR>", { noremap = true, silent = true }) -- Status
vim.keymap.set("n", "<leader>psc", ":PackerClean<CR>", { noremap = true, silent = true })  -- Clean


-- Keybindings (optional)
vim.api.nvim_set_keymap('n', '<leader>U', ':lua UpperCase()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>U', ':lua UpperCase()<CR>', { noremap = true, silent = true })

-- Keybindings (optional)
vim.api.nvim_set_keymap('n', '<leader>L', ':lua LowerCase()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>L', ':lua LowerCase()<CR>', { noremap = true, silent = true })

-- Keybindings (optional)
vim.api.nvim_set_keymap('n', '<leader>S', ':lua SortLines()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>S', ':lua SortLines()<CR>', { noremap = true, silent = true })

-- Keybinding (optional)
vim.api.nvim_set_keymap('n', '<leader>Q', ':lua CloseAllExceptCurrent()<CR>', { noremap = true, silent = true })

-- Keybinding (optional)
vim.api.nvim_set_keymap('n', '<leader>Q', ':lua CloseAllExceptCurrent()<CR>', { noremap = true, silent = true })

