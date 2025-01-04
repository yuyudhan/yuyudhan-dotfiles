vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })        -- Transparent background for Normal
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })      -- Transparent background for NonText
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })       -- Transparent background for Line Numbers
vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })       -- Transparent background for Folded lines
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })  -- Transparent background for End of Buffer

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    end,
})


