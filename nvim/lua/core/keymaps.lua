-- lua/core/keymaps.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Example: Clear search highlights with <leader>h
map('n', '<leader>h', ':nohlsearch<CR>', opts)

