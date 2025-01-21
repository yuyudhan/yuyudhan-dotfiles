-- FilePath: lua/plugins/helpers.lua

-- Ensure this file only contains plugin-related configurations/functions to avoid LazyVim plugin misinterpretation.

-- Define a local module table
local M = {}

-- Function to add numbers at the start of each line
function M.add_number_start(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, i .. " " .. line)
        i = i + 1
    end
end

vim.api.nvim_create_user_command("AddNumberStart", function(opts)
    M.add_number_start(opts)
end, { range = true, desc = "Add numbers at the start of each line" })

-- Function to add numbers at the end of each line
function M.add_number_end(opts)
    local start_line = opts.line1
    local end_line = opts.line2
    local i = 1
    for lnum = start_line, end_line do
        local line = vim.fn.getline(lnum)
        vim.fn.setline(lnum, line .. " " .. i)
        i = i + 1
    end
end

vim.api.nvim_create_user_command("AddNumberEnd", function(opts)
    M.add_number_end(opts)
end, { range = true, desc = "Add numbers at the end of each line" })

-- Function to add numbers at each cursor position
function M.add_number_cursor()
    local start_line = vim.fn.getpos("'<")[2]
    local end_line = vim.fn.getpos("'>")[2]
    local start_col = vim.fn.getpos("'<")[3]
    local i = 1

    for line_num = start_line, end_line do
        local line = vim.fn.getline(line_num)
        local new_line = line:sub(1, start_col - 1) .. i .. line:sub(start_col)
        vim.fn.setline(line_num, new_line)
        i = i + 1
    end
end

vim.api.nvim_create_user_command("AddNumberCursor", function()
    M.add_number_cursor()
end, { range = true, desc = "Add numbers at cursor positions" })

-- Function to copy the relative file path to the clipboard
function M.copy_relative_path()
    local relative_path = vim.fn.expand("%:.")
    vim.fn.setreg("+", relative_path)
    print("Relative path copied to clipboard: " .. relative_path)
end

vim.api.nvim_create_user_command("CopyRelativePath", function()
    M.copy_relative_path()
end, { desc = "Copy relative file path to clipboard" })

-- Function to re-indent the entire file
function M.indent_file()
    vim.cmd("normal! gg=G")
end

vim.api.nvim_create_user_command("IndentFile", function()
    M.indent_file()
end, { desc = "Re-indent the entire file" })

-- Function to insert the file path as a comment
function M.insert_commented_file_path()
    vim.cmd("normal! gg")
    vim.cmd("normal! O<Esc>O<Esc>")
    local file_path = vim.fn.expand("%:.")
    local comment_string = vim.bo.commentstring

    if comment_string == "" or not comment_string:find("%%s") then
        local ft_comment_map = {
            lua = "-- %s",
            python = "# %s",
            javascript = "// %s",
            typescript = "// %s",
            sh = "# %s",
            bash = "# %s",
            zsh = "# %s",
            sql = "-- %s",
            html = "<!-- %s -->",
            css = "/* %s */",
            json = "// %s",
            yaml = "# %s",
            toml = "# %s",
            vim = '" %s',
            markdown = "<!-- %s -->",
        }
        comment_string = ft_comment_map[vim.bo.filetype] or "# %s"
    end

    local formatted_path = " FilePath: " .. file_path
    local commented_path = comment_string:gsub("%%s", formatted_path)
    vim.api.nvim_set_current_line(commented_path)
    vim.cmd("normal! gg")
    vim.cmd("normal! o")
    vim.api.nvim_set_current_line("")
end

vim.api.nvim_create_user_command("InsertFilePathComment", function()
    M.insert_commented_file_path()
end, { desc = "Insert commented file path" })

-- Function to clear the entire file contents
function M.clear_file_contents()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
    print("File contents cleared!")
end

vim.api.nvim_create_user_command("ClearFileContents", function()
    M.clear_file_contents()
end, { desc = "Clear the entire file contents" })

-- Return the module table (empty to avoid LazyVim misinterpretation)
return {}

