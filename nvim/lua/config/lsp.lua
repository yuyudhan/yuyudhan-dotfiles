-- FilePath: lua/config/lsp.lua

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Common on_attach function to map LSP-related keys after the language server attaches to the current buffer
-- This function is called whenever an LSP server successfully attaches to a buffer
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    -- Helper function to set buffer-specific keymaps for LSP functionality
    local buf_set_keymap = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- LSP navigation and action mappings
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- Go to definition
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- Show hover information
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- Go to implementation
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename symbol
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- Find references
    -- Format using conform.nvim if available, fallback to LSP
    buf_set_keymap("n", "<leader>cf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>", opts) -- Format buffer
end

-- Update capabilities for nvim-cmp compatibility
local capabilities = cmp_nvim_lsp.default_capabilities()

-- List of LSP servers with optional custom configurations
-- These servers will be automatically installed by Mason if not present
local servers = {
    ts_ls = {}, -- JavaScript/TypeScript (updated from tsserver)
    eslint = {}, -- ESLint language server
    gopls = {}, -- Go
    rust_analyzer = {}, -- Rust
    basedpyright = {}, -- Python (improved fork of pyright)
    html = {}, -- HTML
    cssls = {}, -- CSS
    tailwindcss = {}, -- Tailwind CSS
    lua_ls = { -- Lua (using lua_ls, formerly sumneko_lua)
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
            },
        },
    },
    dockerls = {}, -- Dockerfile
    docker_compose_language_service = {}, -- Docker Compose
    yamlls = {}, -- YAML
    jsonls = {}, -- JSON
    marksman = {}, -- Markdown
    clangd = {}, -- C/C++
    ansiblels = {}, -- Ansible
    terraformls = {}, -- Terraform
    sqlls = {}, -- SQL
    bashls = {}, -- Bash
}

-- Loop over the servers and set them up with a common configuration
-- This iterates through each server definition and applies consistent settings
for server, config in pairs(servers) do
    config.on_attach = on_attach -- Attach our keybindings function
    config.capabilities = capabilities -- Enable enhanced completion capabilities
    config.flags = { debounce_text_changes = 150 } -- Reduce LSP requests for performance
    lspconfig[server].setup(config) -- Initialize the LSP server
end

return {}

