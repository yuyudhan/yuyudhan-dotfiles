-- lua/utils/helpers.lua

local M = {}

-- Similar to insertnums functionality of Sublime Text
vim.api.nvim_create_user_command("AddNumber", function(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, line .. " " .. i)
        i = i + 1
    end
end, { range = true })

-- Copy the relative path of the current file to the clipboard
vim.api.nvim_create_user_command("CopyRelativePath", function()
    local relative_path = vim.fn.expand("%")
    vim.fn.setreg("+", relative_path)
    print("Relative path copied to clipboard: " .. relative_path)
end, {})

-- Copy the absolute path of the current file to the clipboard
vim.api.nvim_create_user_command("CopyAbsolutePath", function()
    local absolute_path = vim.fn.expand("%:p")
    vim.fn.setreg("+", absolute_path)
    print("Absolute path copied to clipboard: " .. absolute_path)
end, {})

return M

