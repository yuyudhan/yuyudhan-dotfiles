-- lua/utils/helpers.lua

local M = {}

-- Function to add numbers at the start of each line
vim.api.nvim_create_user_command("AddNumberStart", function(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, i .. " " .. line)
        i = i + 1
    end
end, { range = true })

-- Function to add numbers at the end of each line
vim.api.nvim_create_user_command("AddNumberEnd", function(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, line .. " " .. i)
        i = i + 1
    end
end, { range = true })

-- Function to add numbers at each cursor position
vim.api.nvim_create_user_command("AddNumberCursor", function()
    -- Get the start and end lines of the Visual selection
    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]
    local start_col = vim.fn.getpos("'<")[3]
    local i = 1

    -- Iterate over each line in the Visual Block
    for line_num = start_line, end_line do
        local line = vim.fn.getline(line_num)
        -- Add the number at the cursor's column position
        local new_line = line:sub(1, start_col - 1) .. i .. line:sub(start_col)
        vim.fn.setline(line_num, new_line)
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

-- Define the :IndentFile command
vim.api.nvim_create_user_command("IndentFile", function()
    vim.cmd("normal! gg=G")
end, { desc = "Re-indent the entire file" })

return M

