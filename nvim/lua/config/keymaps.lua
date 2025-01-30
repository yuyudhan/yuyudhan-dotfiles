--  FilePath: nvim/lua/config/keymaps.lua

-- Add custom keymaps under <leader>z for all your configurations

-- Keybinding to re-indent the entire file
vim.keymap.set("n", "<leader>zif", "<cmd>IndentFile<CR>", {
    desc = "Re-indent the entire file",
})

-- Keybinding to add a commented file path at the top of the file
vim.keymap.set("n", "<leader>zafn", "<cmd>InsertFilePathComment<CR>", {
    desc = "Add commented file path at the start",
})

-- Keybinding to copy the entire file contents to the clipboard
vim.keymap.set("n", "<leader>zcef", function()
    local cursor_pos = vim.fn.getpos(".") -- Save current cursor position
    vim.cmd('normal! ggVG"+y') -- Select all and copy to clipboard
    vim.fn.setpos(".", cursor_pos) -- Restore cursor position
end, {
    desc = "Copy entire file to clipboard",
})

-- Keybinding to clear the entire file contents
vim.keymap.set("n", "<leader>zclf", "<cmd>ClearFileContents<CR>", {
    desc = "Clear the entire file contents",
})

vim.keymap.set("n", "<leader>zsef", "<cmd>SelectEntireFile<CR>", {
    desc = "Select entire file contents",
})

vim.keymap.set("n", "<leader>zcdm", "<cmd>CopyDiagnosticMessage<CR>", {
    desc = "Copy Diagnostic Message to Clipboard",
})

