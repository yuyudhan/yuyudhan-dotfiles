-- nvim/nvim/lua/yuyudhan/lsp/handlers.lua

-- Example custom handlers for LSP

local handlers = {}

handlers.hover = function(...)
    vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })(...)
end

handlers.signature_help = function(...)
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })(...)
end

return handlers

