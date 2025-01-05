-- nvim/lua/core/options.lua

-- Enable true colors
vim.opt.termguicolors = true

-- Set transparent background for various elements
local set_transparent_background = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
end

set_transparent_background()

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_transparent_background,
})

-- Set CursorHoldI timeout and auto switch to normal mode after inactivity
vim.o.updatetime = 1500
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",
    command = "stopinsert",
})

-- Configure indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4 -- Number of spaces per tab
vim.o.shiftwidth = 4 -- Number of spaces per indentation level
vim.o.softtabstop = 4 -- Ensure backspacing removes correct number of spaces
vim.o.autoindent = true -- Enable auto-indentation
vim.o.smartindent = true -- Enable smart-indentation

-- Autosave before leaving a buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.modified then
            vim.cmd("write")
        end
    end,
})

-- Enable line numbers
vim.o.number = true -- Show absolute line numbers
vim.o.relativenumber = true -- Show relative line numbers

