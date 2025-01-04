-- lua/lsp/servers.lua

local lspconfig = require('lspconfig')

-- Example: Python LSP (pyright)
lspconfig.pyright.setup{}

-- Example: Go LSP (gopls)
lspconfig.gopls.setup{}

-- Example: JavaScript/TypeScript LSP (ts_ls)
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Custom on_attach logic
    -- For example: Key mappings for LSP functions
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    -- TypeScript-specific settings can go here
    typescript = {
      -- Example: Enable implicit project configuration
      implicitProjectConfig = {
        checkJs = true,
      },
    },
  },
})

-- Add more LSP server configurations here

