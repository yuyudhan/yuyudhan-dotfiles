-- FilePath: lua/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Automatic exit from insert mode after period of inactivity
vim.o.updatetime = 1500  -- Set update time to 1.5 seconds
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",           -- Apply to all file types
    command = "stopinsert",  -- Exit insert mode when cursor is idle for updatetime
})

-- End of line handling configuration
-- Force 'noendofline' globally to prevent automatic newline at end of file
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre" }, {
    pattern = "*",                    -- Apply to all file types
    callback = function()
        vim.opt.endofline = false    -- Disable automatic newline at end of file
    end,
})

-- Ensure a blank line at the end of the file for consistent formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",                    -- Apply to all file types
    callback = function()
        local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, true)[1] or ""  -- Get the last line
        if last_line:match("^%s*$") == nil then  -- If last line is not empty or whitespace-only
            vim.api.nvim_buf_set_lines(0, -1, -1, true, { "" })  -- Add a blank line at the end
        end
    end,
})

-- Trim trailing whitespace on save for clean code formatting
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",                    -- Apply to all file types
    callback = function()
        -- Save cursor position to restore after trimming
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Trim whitespace from end of all lines (the 'e' flag suppresses errors if no matches)
        local last_line = vim.api.nvim_buf_line_count(0)
        vim.cmd([[%s/\s\+$//e]])  -- Remove trailing whitespace from all lines

        -- Restore cursor position (adjusting if line count changed)
        local new_last_line = vim.api.nvim_buf_line_count(0)
        if cursor_pos[1] > new_last_line then
            cursor_pos[1] = new_last_line  -- Move cursor to last line if original line was deleted
        end
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- Remove multiple consecutive blank lines for cleaner code structure
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",                    -- Apply to all file types
    callback = function()
        -- Save cursor position to restore after cleanup
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Replace multiple consecutive blank lines with maximum of one blank line
        vim.cmd([[%s/\n\n\n\+/\r\r/e]])  -- Replace 3+ newlines with 2 newlines (1 blank line)

        -- Restore cursor position (adjusting if line count changed)
        local new_last_line = vim.api.nvim_buf_line_count(0)
        if cursor_pos[1] > new_last_line then
            cursor_pos[1] = new_last_line  -- Move cursor to last line if original line was deleted
        end
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- Automatic file reload when files are changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

-- Show notification when file is auto-reloaded
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.notify("File reloaded: " .. vim.fn.expand("%"), vim.log.levels.INFO)
    end,
})

