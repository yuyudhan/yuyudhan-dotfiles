-- lua/core/options.lua

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Enable mouse
opt.mouse = 'a'

-- Disable swap files
opt.swapfile = false

-- Enable clipboard
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Case insensitive searching
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 300

-- Set completeopt to have a better completion experience
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Disable netrw (if using nvim-tree)
opt.termguicolors = true

