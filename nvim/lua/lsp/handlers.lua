-- nvim/lua/lsp/handlers.lua

-- Example custom handlers for LSP
local handlers = {}

handlers.hover = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

handlers.signature_help = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

return handlers

