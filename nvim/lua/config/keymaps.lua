--  FilePath: nvim/lua/config/keymaps.lua

-- Custom keymaps for enhanced productivity and workflow
-- Most custom commands are organized under <leader>z prefix for easy access

-- Override default 'gf' (go to file) with Telescope LSP definitions for better navigation
vim.keymap.set("n", "gf", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true })

-- Essential leader keybindings for common operations
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" }) -- Quick save
vim.keymap.set("n", "<leader>qx", "<cmd>q<CR>", { desc = "Quit", noremap = true, silent = true }) -- Quick quit
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Remove search highlight", silent = true }) -- Clear search highlighting

-- File formatting using LSP formatter (works with LazyVim distro)
vim.keymap.set("n", "<leader>zff", function()
    vim.lsp.buf.format({ async = true }) -- Format file asynchronously using LSP
end, { desc = "Format file" })

-- File indentation using custom helper function
vim.keymap.set("n", "<leader>zif", "<cmd>IndentFile<CR>", {
    desc = "Re-indent the entire file", -- Uses the IndentFile command from helpers.lua
})

-- File path management - add commented file path header
vim.keymap.set("n", "<leader>zafn", "<cmd>InsertFilePathComment<CR>", {
    desc = "Add commented file path at the start", -- Inserts '-- FilePath: path/to/file' at top
})

-- File path copying - copy relative path to repository
vim.keymap.set("n", "<leader>crp", "<cmd>CopyRelativePath<CR>", {
    desc = "Copy relative file path to clipboard", -- Copies path relative to current working directory
})

-- File path copying - copy absolute path
vim.keymap.set("n", "<leader>cap", "<cmd>CopyAbsolutePath<CR>", {
    desc = "Copy absolute file path to clipboard", -- Copies full absolute path to file
})

-- File content manipulation - copy entire file to clipboard
vim.keymap.set("n", "<leader>zcef", function()
    local cursor_pos = vim.fn.getpos(".") -- Save current cursor position
    vim.cmd('normal! ggVG"+y') -- Select all (gg=top, VG=visual select to end) and copy to system clipboard
    vim.fn.setpos(".", cursor_pos) -- Restore cursor position after operation
end, {
    desc = "Copy entire file to clipboard",
})

-- File content manipulation - clear entire file
vim.keymap.set("n", "<leader>zclf", "<cmd>ClearFileContents<CR>", {
    desc = "Clear the entire file contents", -- Removes all content from current buffer
})

-- File selection - select entire file content
vim.keymap.set("n", "<leader>zsef", "<cmd>SelectEntireFile<CR>", {
    desc = "Select entire file contents", -- Visually select all content in the file
})

-- LSP diagnostics - copy diagnostic message from current line
vim.keymap.set("n", "<leader>zcdm", "<cmd>CopyDiagnosticMessage<CR>", {
    desc = "Copy Diagnostic Message to Clipboard", -- Copy error/warning message from current line
})

-- LSP diagnostics - copy all diagnostic messages from entire file
vim.keymap.set("n", "<leader>zcdam", "<cmd>CopyAllDiagnosticMessagesInFile<CR>", {
    desc = "Copy all Diagnostic Message to Clipboard", -- Copy all errors/warnings from entire file
})

-- Line manipulation - clear line content without affecting register
vim.keymap.set("n", "<leader>zdd", '"_dd', {
    desc = "Clear the line but not remove it", -- Delete line to black hole register (doesn't affect clipboard)
})

-- Window navigation - alternative keybindings for pane movement
vim.keymap.set("n", "<leader>wh", "<C-w>h", {
    desc = "Move to left pane", -- Move focus to left window pane
})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {
    desc = "Move to below pane", -- Move focus to window pane below
})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {
    desc = "Move to above pane", -- Move focus to window pane above
})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {
    desc = "Move to right pane", -- Move focus to right window pane
})

-- Tmux integration - seamless navigation between Neovim and tmux panes
vim.keymap.set(
    "n",
    "<C-h>",
    "<cmd>TmuxNavigateLeft<CR>",
    { noremap = true, silent = true, desc = "Navigate to left pane" } -- Move left (works across tmux/nvim boundary)
)
vim.keymap.set(
    "n",
    "<C-j>",
    "<cmd>TmuxNavigateDown<CR>",
    { noremap = true, silent = true, desc = "Navigate to pane below" } -- Move down (works across tmux/nvim boundary)
)
vim.keymap.set(
    "n",
    "<C-k>",
    "<cmd>TmuxNavigateUp<CR>",
    { noremap = true, silent = true, desc = "Navigate to pane above" } -- Move up (works across tmux/nvim boundary)
)
vim.keymap.set(
    "n",
    "<C-l>",
    "<cmd>TmuxNavigateRight<CR>",
    { noremap = true, silent = true, desc = "Navigate to right pane" } -- Move right (works across tmux/nvim boundary)
)
vim.keymap.set(
    "n",
    "<leader>tp",
    "<cmd>TmuxNavigatePrevious<CR>",
    { noremap = true, silent = true, desc = "Navigate to previous pane" } -- Go to previously active pane
)

-- Quick line insertion - add blank lines without entering insert mode
vim.keymap.set(
    "n",
    "<leader>o",
    ":put =''<CR>",
    { noremap = true, silent = true, desc = "Blank line after current line" } -- Insert blank line below cursor
)
vim.keymap.set(
    "n",
    "<leader>O",
    ":put! =''<CR>",
    { noremap = true, silent = true, desc = "Blank line before current line" } -- Insert blank line above cursor
)

