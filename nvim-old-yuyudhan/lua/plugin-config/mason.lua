-- nvim/lua/plugin-config/mason.lua


-- Ensure Mason is properly set up
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
mason.setup({
    ui = {
        border = "rounded", -- Rounded border for the Mason UI
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

-- Configure Mason-LSPConfig
mason_lspconfig.setup({
    ensure_installed = {
        "ts_ls",       -- JavaScript, TypeScript
        "tailwindcss",    -- Tailwind CSS
        "pyright",        -- Python
        "gopls",          -- Go
        "phpactor",       -- PHP
        "eslint",         -- JavaScript/TypeScript linting
    },
    automatic_installation = true, -- Automatically install missing servers
})

