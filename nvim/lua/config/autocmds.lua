-- FilePath: lua/config/autocmds.lua
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.o.updatetime = 1500
vim.api.nvim_create_autocmd("CursorHoldI", {
    pattern = "*",
    command = "stopinsert",
})

-- End of line addition
-- Force 'noendofline' globally
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre" }, {
    pattern = "*",
    callback = function()
        vim.opt.endofline = false
    end,
})

-- Ensure a blank line at the end of the file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, true)[1] or ""
        if last_line:match("^%s*$") == nil then
            vim.api.nvim_buf_set_lines(0, -1, -1, true, { "" })
        end
    end,
})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Trim whitespace (excluding the last blank line we're adding)
        local last_line = vim.api.nvim_buf_line_count(0)
        vim.cmd([[%s/\s\+$//e]])

        -- Restore cursor position (adjusting if needed)
        local new_last_line = vim.api.nvim_buf_line_count(0)
        if cursor_pos[1] > new_last_line then
            cursor_pos[1] = new_last_line
        end
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

-- Remove multiple consecutive blank lines
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        -- Save cursor position
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        -- Replace multiple blank lines with a single blank line
        vim.cmd([[%s/\n\n\n\+/\r\r/e]])

        -- Restore cursor position (adjusting if needed)
        local new_last_line = vim.api.nvim_buf_line_count(0)
        if cursor_pos[1] > new_last_line then
            cursor_pos[1] = new_last_line
        end
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

