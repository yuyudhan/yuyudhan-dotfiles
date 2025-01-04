-- lua/plugins/nvim-lspconfig.lua

local lspconfig = require('lspconfig')

-- Mason Setup (if using Mason for managing LSP servers)
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'pyright', 'gopls', 'ts_ls' }, -- Add desired LSP servers
})

-- LSP settings
local on_attach = function(client, bufnr)
  -- Key mappings for LSP
  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- Add more key mappings as needed
end

-- Capabilities for nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup LSP servers
local servers = { 'pyright', 'gopls', 'tsserver' }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


