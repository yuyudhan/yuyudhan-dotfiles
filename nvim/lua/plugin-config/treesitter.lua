-- nvim/lua/plugin-config/treesitter.lua

require("nvim-treesitter.configs").setup({
    ensure_installed = "all", -- Install all parsers
    highlight = { enable = true }, -- Enable syntax highlighting
    indent = { enable = true }, -- Enable automatic indentation
})

