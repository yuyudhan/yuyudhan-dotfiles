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

-- Configuration for Comment.nvim
require('Comment').setup({
    padding = true,         -- Add a space between the comment marker and the text
    sticky = true,          -- Cursor stays in place when toggling comments
    ignore = nil,           -- Ignore specific lines or patterns
    mappings = {
        basic = true,       -- Enable `gcc`, `gc` keybindings
        extra = true,       -- Enable `gco`, `gcO`, `gcA` keybindings
    },
})

-- File: lua/config/neoscroll.lua
require('neoscroll').setup({
    -- All these options are defaults
    mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
    hide_cursor = true,            -- Hide cursor while scrolling
    stop_eof = true,               -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false,  -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,    -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true,  -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,               -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
    performance_mode = false,     -- Disable "Performance Mode" on all buffers.
})

