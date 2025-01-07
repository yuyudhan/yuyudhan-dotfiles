-- nvim/lua/utils/helpers.lua

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

-- Function to auto-indent the file without moving the cursor
local auto_indent = function()
    if not is_valid_file_buffer() then return end -- Skip invalid buffers
    local save_cursor = vim.fn.getpos(".") -- Save the current cursor position
    vim.cmd("normal! gg=G") -- Auto-indent the entire file
    vim.fn.setpos(".", save_cursor) -- Restore the saved cursor position
end

-- Autocommand to auto-indent the file on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = auto_indent,
})


-- Function to convert text to uppercase
function UpperCase()
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'v' or mode == 'V' or mode == '\22' then
        -- Visual mode
        vim.cmd('normal! gU')
    else
        -- Normal mode: convert the entire line
        vim.cmd('normal! gUU')
    end
end

-- Function to convert text to lowercase
function LowerCase()
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'v' or mode == 'V' or mode == '\22' then
        -- Visual mode
        vim.cmd('normal! gu')
    else
        -- Normal mode: convert the entire line
        vim.cmd('normal! guu')
    end
end

-- Function to get current time in format dd-mmm-yyyy, hh:mm
function GetCurrentTime()
    local time = os.date("%d-%b-%Y, %H:%M")
    vim.api.nvim_put({ time }, 'c', true, true)
end


-- Function to close all buffers except the current one
local CloseAllExceptCurrent = function()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end


function SortLines()
    local mode = vim.api.nvim_get_mode().mode
    if mode == 'v' or mode == 'V' or mode == '\22' then
        -- Visual mode: sort the selected lines
        -- Get the visual selection range
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")
        -- Apply sort to the selected range
        vim.cmd(string.format("%d,%dsort", start_line, end_line))
    else
        -- Normal mode: sort the entire buffer
        vim.cmd(":%sort")
    end
end


local M = {}

-- Reload Neovim configuration
M.reload_config = function()
    for name, _ in pairs(package.loaded) do
        if name:match("^user") or name:match("^core") or name:match("^plugin%-config") then
            package.loaded[name] = nil
        end
    end
    vim.cmd("source $MYVIMRC")
    print("Neovim configuration reloaded!")
end

return M

