--  FilePath: nvim/lua/config/keymaps.lua

-- Add custom keymaps under <leader>z for all your configurations

vim.keymap.set("n", "gf", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })

-- Leader keybindings and shortcuts
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>qx", "<cmd>q<CR>", { desc = "Quit", noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Remove search highlight", silent = true })

-- leader z ff should format file. I'm using lazyvim distro
vim.keymap.set("n", "<leader>zff", function()
    vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

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

-- Keybinding to clear the line but not remove it
vim.keymap.set("n", "<leader>zdd", '"_dd', {
    desc = "Clear the line but not remove it",
})

-- Keybindings for moving between panes
vim.keymap.set("n", "<leader>wh", "<C-w>h", {
    desc = "Move to left pane",
})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {
    desc = "Move to below pane",
})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {
    desc = "Move to above pane",
})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {
    desc = "Move to right pane",
})

vim.keymap.set(
    "n",
    "<C-h>",
    "<cmd>TmuxNavigateLeft<CR>",
    { noremap = true, silent = true, desc = "Navigate to left pane" }
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<cmd>TmuxNavigateDown<CR>",
    { noremap = true, silent = true, desc = "Navigate to pane below" }
)
vim.keymap.set(
    "n",
    "<C-k>",
    "<cmd>TmuxNavigateUp<CR>",
    { noremap = true, silent = true, desc = "Navigate to pane above" }
)
vim.keymap.set(
    "n",
    "<C-l>",
    "<cmd>TmuxNavigateRight<CR>",
    { noremap = true, silent = true, desc = "Navigate to right pane" }
)
vim.keymap.set(
    "n",
    "<leader>tp",
    "<cmd>TmuxNavigatePrevious<CR>",
    { noremap = true, silent = true, desc = "Navigate to previous pane" }
)

-- Keybindings for inserting blank lines
vim.keymap.set(
    "n",
    "<leader>o",
    ":put =''<CR>",
    { noremap = true, silent = true, desc = "Blank line after current line" }
)
vim.keymap.set(
    "n",
    "<leader>O",
    ":put! =''<CR>",
    { noremap = true, silent = true, desc = "Blank line before current line" }
)

