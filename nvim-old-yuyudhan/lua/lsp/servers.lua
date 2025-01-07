-- nvim/lua/lsp/servers.lua

-- Ensure Mason and lspconfig are properly set up
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- Initialize Mason
mason.setup()

-- Define the LSP servers to install and configure
local servers = {
    "ts_ls",        -- JavaScript, TypeScript
    "tailwindcss",     -- Tailwind CSS
    "pyright",         -- Python
    "gopls",           -- Go
    "phpactor",        -- PHP
    "eslint",          -- JavaScript/TypeScript linting
}

-- Automatically install listed servers using Mason
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

-- Configure each LSP server
for _, server in ipairs(servers) do
    lspconfig[server].setup({
        on_attach = function(client, bufnr)
            -- Enable LSP features (e.g., hover, completion)
            vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

            -- Add custom keymaps for LSP
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
        flags = {
            debounce_text_changes = 150,
        },
        settings = {}, -- Add server-specific settings here if needed
    })
end

