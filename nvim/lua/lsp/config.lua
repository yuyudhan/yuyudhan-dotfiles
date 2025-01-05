-- nv/Users/yuyudhan/yuyudhan-dotfiles/im/lua/lsp/config.lua

-- Additional LSP configuration setup
local lspconfig = require("lspconfig")
local handlers = require("lsp.handlers")

-- Attach custom handlers for hover and signature help
vim.lsp.handlers["textDocument/hover"] = handlers.hover
vim.lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- Add fallback or general LSP configurations here if needed

