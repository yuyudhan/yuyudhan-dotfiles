-- nvim/nvim/lua/yuyudhan/plugin-config.lua

-- Lazygit configuration
vim.g.lazygit_floating_window_winblend = 0 -- Transparency of the floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- Scaling factor for the floating window
vim.g.lazygit_floating_window_border_chars = { '╭', '╮', '╰', '╯', '─', '│', '╭', '╮' } -- Border characters
vim.g.lazygit_use_neovim_remote = 1 -- Use Neovim's remote for better integration

-- Configuration for which-key
local wk = require("which-key")

wk.setup {
    plugins = {
        marks = true,
        registers = true,
        spelling = { enabled = true, suggestions = 20 },
    },
    -- Key label replacement
    key_labels = {
        ["<leader>"] = "SPC",
    },
    window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
    },
}

-- Register keymap groups with which-key
wk.register({
    b = { name = "Buffers" },
    f = { name = "File" },
    g = { name = "Git" },
    p = { name = "Project" },
    w = { name = "Windows" },
}, { prefix = "<leader>" })

