-- nvim/init.lua

-- ========================================
-- Core Settings
-- ========================================
require("core.options")        -- General settings and options
require("core.autocommands")   -- Autocommands
require("core.keymaps")        -- Keymaps

-- ========================================
-- Plugin Management
-- ========================================
require("plugins")             -- Plugin definitions and configurations
require("plugin-config")             -- Plugin definitions and configurations

-- ========================================
-- LSP (Language Server Protocol)
-- ========================================
require("lsp.config")          -- LSP configurations
require("lsp.handlers")        -- LSP handlers and enhancements

-- ========================================
-- Utility Modules
-- ========================================
require("utils.helpers")       -- Helper functions


