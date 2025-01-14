-- lua/plugins/helpers.lua

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

vim.api.nvim_create_user_command("CopyRelativePath", function()
    -- Force relative path to current working directory
    local relative_path = vim.fn.expand("%:.")
    vim.fn.setreg("+", relative_path)
    print("Relative path copied to clipboard: " .. relative_path)
end, {})

-- Define the :IndentFile command
vim.api.nvim_create_user_command("IndentFile", function()
    vim.cmd("normal! gg=G")
end, { desc = "Re-indent the entire file" })

local function insert_commented_file_path()
    -- Move to the first line
    vim.cmd("normal! gg")

    vim.cmd("normal! O<Esc>O<Esc>")

    -- Get the relative file path
    local file_path = vim.fn.expand("%:.")

    -- Get commentstring for the current filetype
    local comment_string = vim.bo.commentstring
    if comment_string == "" then
        comment_string = "# %s" -- Default to shell-style comment
    end

    -- Format the file path as a comment
    local commented_path = comment_string:gsub("%%s", file_path)

    -- Insert the commented file path
    vim.api.nvim_set_current_line(commented_path)

    -- Insert a blank second line
    -- vim.cmd("normal! o<Esc>")
    vim.cmd("normal! gg")
    vim.cmd("normal! o")
    vim.api.nvim_set_current_line("")
end

-- Create a command to trigger this function
vim.api.nvim_create_user_command("InsertFilePathComment", insert_commented_file_path, {})

return M

