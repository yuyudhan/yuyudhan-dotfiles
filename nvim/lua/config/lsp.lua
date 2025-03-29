-- FilePath: lua/config/lsp.lua

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Common on_attach function to map LSP-related keys after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- Example LSP mappings
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
end

-- Update capabilities for nvim-cmp compatibility
local capabilities = cmp_nvim_lsp.default_capabilities()

-- List of LSP servers with optional custom configurations
local servers = {
    tsserver = {}, -- JavaScript/TypeScript
    gopls = {}, -- Go
    rust_analyzer = {}, -- Rust
    pyright = {}, -- Python
    html = {}, -- HTML
    lua_ls = { -- Lua (using lua_ls, formerly sumneko_lua)
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
            },
        },
    },
    dockerls = {}, -- Dockerfile
    yamlls = {}, -- YAML
    jsonls = {}, -- JSON
}

-- Loop over the servers and set them up with a common configuration
for server, config in pairs(servers) do
    config.on_attach = on_attach
    config.capabilities = capabilities
    config.flags = { debounce_text_changes = 150 }
    lspconfig[server].setup(config)
end

return {}

