-- lua/plugins/lazygit.lua

require('lazygit').setup {
  -- Your configuration comes here
  -- or leave it empty to use the default settings
}

-- Optional: Key mapping to open Lazygit
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>LazyGit<CR>', { noremap = true, silent = true })

