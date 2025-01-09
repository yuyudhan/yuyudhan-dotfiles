-- lua/config/keymaps.lua

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Space>as", function()
    local cursor_pos = vim.fn.getpos(".") -- Save current cursor position
    vim.cmd('normal! ggVG"+y') -- Select all and copy to clipboard
    vim.fn.setpos(".", cursor_pos) -- Restore cursor position
end, { desc = "Select all and copy to clipboard, cursor stays" })

vim.keymap.set("n", "<Space>ii", "<cmd>IndentFile<CR>", { desc = "Re-indent the entire file" })

