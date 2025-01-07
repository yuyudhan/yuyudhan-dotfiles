-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--
-- /Users/yuyudhan/yuyudhan/yuyudhan-dotfiles/nvim/lua/config/options.lua

-- Set leader key before other configurations
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.encoding = "utf-8" -- File encoding
vim.opt.fileencoding = "utf-8" -- Set file encoding
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.mouse = "a" -- Enable mouse in all modes
vim.opt.title = true -- Set window title

-- User Interface
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = true -- Highlight current line
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.wrap = false -- Disable line wrapping
vim.opt.scrolloff = 8 -- Minimum lines above/below cursor
vim.opt.sidescrolloff = 8 -- Minimum lines to the side of cursor
vim.opt.termguicolors = true -- Enable true color support
vim.opt.splitbelow = true -- Horizontal splits open below
vim.opt.splitright = true -- Vertical splits open to the right

-- Tab and Indentation
vim.opt.tabstop = 4 -- Number of spaces for a tab
vim.opt.shiftwidth = 4 -- Number of spaces for indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.smarttab = true -- Insert tabs intelligently
vim.opt.autoindent = true -- Auto-indent new lines
vim.opt.smartindent = true -- Smart indentation

-- Search
vim.opt.ignorecase = true -- Ignore case in searches
vim.opt.smartcase = true -- Override ignorecase if uppercase is present
vim.opt.incsearch = true -- Show matches while typing
vim.opt.hlsearch = true -- Highlight search results

-- Backup and Swap
vim.opt.swapfile = false -- Disable swap files
vim.opt.backup = false -- Disable backups
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Undo directory

-- Performance
vim.opt.updatetime = 300 -- Faster completion and diagnostics
vim.opt.timeoutlen = 500 -- Key sequence timeout
vim.opt.hidden = true -- Enable background buffers

-- Folding
vim.opt.foldmethod = "expr" -- Folding method
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folds
vim.opt.foldenable = false -- Disable folding by default

-- Highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {timeout=200}]])

-- Disable distribution plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LazyVim integrations
-- Set LazyVim colorscheme

-- Leader keybindings and shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Remove search highlight" })

-- Custom LSP settings
vim.lsp.set_log_level("info")
