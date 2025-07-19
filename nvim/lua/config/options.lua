-- FilePath: lua/config/options.lua

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set leader key before other configurations
-- The leader key is used as a prefix for custom keybindings
vim.g.mapleader = " "         -- Set space as the main leader key
vim.g.maplocalleader = " "    -- Set space as the local leader key for buffer-specific mappings
vim.g.autoformat = "true"      -- Enable automatic formatting on save

-- General settings that affect overall Neovim behavior
vim.opt.encoding = "utf-8"        -- Internal character encoding used by Neovim
vim.opt.fileencoding = "utf-8"    -- Character encoding for file reading/writing
vim.opt.clipboard = "unnamedplus"  -- Sync with system clipboard (allows copy/paste with OS)
vim.opt.mouse = "a"               -- Enable mouse support in all modes (normal, visual, insert, command)
vim.opt.title = true               -- Set the window title to show current file information

-- User Interface configuration for better visual experience
vim.opt.number = true              -- Show absolute line numbers on the left
vim.opt.relativenumber = true      -- Show relative line numbers (useful for motions like 5j, 3k)
vim.opt.cursorline = true          -- Highlight the line where the cursor is located
vim.opt.signcolumn = "yes"          -- Always show the sign column (prevents text shifting when signs appear)
vim.opt.wrap = false               -- Disable line wrapping (long lines extend beyond screen width)
vim.opt.scrolloff = 8              -- Keep minimum 8 lines visible above/below cursor when scrolling
vim.opt.sidescrolloff = 8          -- Keep minimum 8 columns visible left/right of cursor when scrolling horizontally
vim.opt.termguicolors = true       -- Enable 24-bit RGB color support for better syntax highlighting
vim.opt.splitbelow = true          -- New horizontal splits open below current window
vim.opt.splitright = true         -- New vertical splits open to the right of current window

-- Tab and Indentation settings for consistent code formatting
vim.opt.tabstop = 4        -- Number of spaces that a tab character represents when displayed
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- Convert tabs to spaces when typing
vim.opt.smarttab = true    -- Insert tabs intelligently at the beginning of lines
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smart indentation for C-like languages (recognizes brackets, etc.)

-- Search behavior configuration for efficient text finding
vim.opt.ignorecase = true  -- Ignore case in search patterns (makes searches case-insensitive)
vim.opt.smartcase = true   -- Override ignorecase if search contains uppercase letters
vim.opt.incsearch = true   -- Show search matches as you type (incremental search)
vim.opt.hlsearch = true    -- Highlight all search matches in the buffer

-- Backup and Swap file management for data safety and performance
vim.opt.swapfile = false   -- Disable swap files (temporary files created during editing)
vim.opt.backup = false     -- Disable backup files (copies of original files)
vim.opt.undofile = true    -- Enable persistent undo (undo history survives Neovim restarts)
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Directory where undo files are stored

-- Performance optimizations for responsive editing experience
vim.opt.updatetime = 300   -- Time in milliseconds to wait before triggering CursorHold event (affects completion and diagnostics)
vim.opt.timeoutlen = 500   -- Time in milliseconds to wait for a mapped sequence to complete
vim.opt.hidden = true      -- Allow buffers to be hidden without saving (enables background buffers)

-- File reload configuration for external changes
vim.opt.autoread = true    -- Automatically reload files changed outside of Neovim

-- Folding configuration for code structure visualization
vim.opt.foldmethod = "expr"                        -- Use expression-based folding method
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"     -- Use Treesitter for intelligent code folding
vim.opt.foldenable = false                         -- Start with all folds open (folding disabled by default)

-- Highlight on yank - briefly highlight yanked text for visual feedback
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {timeout=200}]])

-- Disable built-in Neovim plugins that we replace with better alternatives
vim.g.loaded_netrw = 1       -- Disable netrw (we use neo-tree for file management)
vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin

-- LazyVim integrations
-- Set LazyVim colorscheme

-- Custom LSP settings for debugging and development
vim.lsp.set_log_level("info")  -- Set LSP log level to 'info' for detailed logging

