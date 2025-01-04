-- lua/lsp/servers/pyright.lua

local lspconfig = require('lspconfig')

lspconfig.pyright.setup({
  on_attach = function(client, bufnr)
    -- Custom on_attach logic for Python
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  end,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})

