-- nvim/nvim/lua/yuyudhan/config.lua

-- ************************************************************
-- Set the CursorHoldI timeout
vim.o.updatetime = 1500 -- Time in milliseconds

-- Auto switch to normal mode after inactivity in insert mode
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",
    command = "stopinsert",
})

-- ************************************************************
-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set the number of spaces per tab
vim.o.tabstop = 4

-- Set the number of spaces per indentation level
vim.o.shiftwidth = 4

-- Ensure backspacing removes the correct number of spaces
vim.o.softtabstop = 4

-- Enable auto-indentation
vim.o.autoindent = true
vim.o.smartindent = true

-- ************************************************************
-- Autosave before leaving buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.modified then
            vim.cmd("write")
        end
    end,
})

-- ************************************************************
-- Enable both absolute and relative line numbers
vim.o.number = true -- Show absolute line number
vim.o.relativenumber = true -- Show relative line numbers

