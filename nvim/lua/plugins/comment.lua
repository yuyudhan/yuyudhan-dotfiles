-- lua/plugins/comment.lua

require('Comment').setup({
  toggler = {
    line = '<leader>c',      -- Toggle comment on the current line
    block = '<leader>bc',    -- Toggle block comment
  },
  opleader = {
    line = '<leader>c',      -- Operator-pending mappings for line comments
    block = '<leader>bc',    -- Operator-pending mappings for block comments
  },
  mappings = {
    basic = true,            -- Enable basic key mappings
    extra = false,           -- Disable extra key mappings
  },
})

