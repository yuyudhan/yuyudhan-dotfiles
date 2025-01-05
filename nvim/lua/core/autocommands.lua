-- nvim/lua/core/autocommands.lua

-- Autosave before leaving a buffer
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.buftype == "" and vim.bo.modified then
            vim.cmd("write")
        end
    end,
})


-- Set CursorHoldI timeout and auto switch to normal mode after inactivity
vim.o.updatetime = 1500
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",
    command = "stopinsert",
})


