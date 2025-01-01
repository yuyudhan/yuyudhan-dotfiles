-- nvim/nvim/lua/yuyudhan/macros.lua

-- Similar to insertnums functionality of Sublime Text
vim.api.nvim_create_user_command(
"AddNumber",
function(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, line .. ' ' .. i)
        i = i + 1
    end
end,
{ range = true }
)

-- Copy the relative path of the current file to the clipboard
vim.api.nvim_create_user_command(
"CopyRelativePath",
function()
    local relative_path = vim.fn.expand('%')
    vim.fn.setreg('+', relative_path)
    print("Relative path copied to clipboard: " .. relative_path)
end,
{}
)

-- Copy the absolute path of the current file to the clipboard
vim.api.nvim_create_user_command(
"CopyAbsolutePath",
function()
    local absolute_path = vim.fn.expand('%:p')
    vim.fn.setreg('+', absolute_path)
    print("Absolute path copied to clipboard: " .. absolute_path)
end,
{}
)

-- Helper function: Check if the buffer is valid for file-related operations
local function is_valid_file_buffer()
    local buf_name = vim.api.nvim_buf_get_name(0)  -- Buffer name
    local buf_type = vim.bo.buftype                -- Buffer type
    return buf_name ~= "" and buf_type == ""       -- Ensure buffer has a name and is not special (e.g., nofile, terminal)
end

-- Ensure an extra blank line at the end of the file when saving
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        if not is_valid_file_buffer() then return end -- Skip invalid buffers
        local last_line = vim.fn.getline("$")
        if last_line ~= "" then
            vim.fn.append("$", "")
        end
    end
})

-- Function to remove trailing spaces
local remove_trailing_spaces = function()
    if not is_valid_file_buffer() then return end -- Skip invalid buffers
    local save_cursor = vim.fn.getpos(".") -- Save cursor position
    vim.cmd([[%s/\s\+$//e]]) -- Remove trailing spaces
    vim.fn.setpos(".", save_cursor) -- Restore cursor position
end

-- Autocommand to remove trailing spaces on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = remove_trailing_spaces,
})

-- Function to auto-indent the file
local auto_indent = function()
    if not is_valid_file_buffer() then return end -- Skip invalid buffers
    vim.cmd("normal! gg=G") -- Auto-indent the entire file
end

-- Autocommand to auto-indent the file on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = auto_indent,
})

