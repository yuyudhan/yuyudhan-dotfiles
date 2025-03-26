-- FilePath: lua/plugins/helpers.lua

-- This file contains utility functions for Neovim plugins, providing commands for line numbering, file path manipulation, and diagnostics handling. It ensures efficient and user-friendly interactions with the editor, enhancing productivity and code management.

local M = {}

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

function M.copy_relative_path()
    local relative_path = vim.fn.expand("%:.")
    vim.fn.setreg("+", relative_path)
    print("Relative path copied to clipboard: " .. relative_path)
end

vim.api.nvim_create_user_command("CopyRelativePath", function()
    M.copy_relative_path()
end, { desc = "Copy relative file path to clipboard" })

function M.indent_file()
    vim.cmd("normal! gg=G")
end

vim.api.nvim_create_user_command("IndentFile", function()
    M.indent_file()
end, { desc = "Re-indent the entire file" })

function M.insert_commented_file_path()
    -- Go to the top of the file and open two new lines.
    vim.cmd("normal! gg")
    vim.cmd("normal! O<Esc>O<Esc>")

    local file_path = vim.fn.expand("%:.")
    local comment_string = vim.bo.commentstring

    -- If no valid comment string is set, use our own mapping.
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
            go = "// %s",
            rust = "// %s",
            java = "// %s",
            c = "// %s",
            cpp = "// %s",
            php = "// %s",
            ruby = "# %s",
            swift = "// %s",
            kotlin = "// %s",
        }
        comment_string = ft_comment_map[vim.bo.filetype] or "# %s"
    end

    -- Create the file path string with exactly one leading space already provided by the comment template.
    local formatted_path = "FilePath: " .. file_path
    local commented_path = comment_string:gsub("%%s", formatted_path)

    -- Insert the commented file path in the first line.
    vim.api.nvim_set_current_line(commented_path)
    vim.cmd("normal! gg")
    vim.cmd("normal! o")

    print("Inserted relative file path in first line (commented)")

    -- Clear the current line after printing.
    vim.api.nvim_set_current_line("")
end

vim.api.nvim_create_user_command("InsertFilePathComment", function()
    M.insert_commented_file_path()
end, { desc = "Insert commented file path" })

function M.clear_file_contents()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
    print("File contents cleared!")
end

vim.api.nvim_create_user_command("ClearFileContents", function()
    M.clear_file_contents()
end, { desc = "Clear the entire file contents" })

function M.select_entire_file()
    vim.cmd("normal! ggVG")
    print("Entire file selected!")
end

vim.api.nvim_create_user_command("SelectEntireFile", function()
    M.select_entire_file()
end, { desc = "Select entire file content while preserving cursor position" })

function M.copy_diagnostic_message()
    local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
    if not diagnostics or #diagnostics == 0 then
        print("No diagnostics found on this line")
        return
    end

    local diag = diagnostics[1]
    local message = diag.message or "No message"
    local code = diag.code or (diag.user_data and diag.user_data.lsp and diag.user_data.lsp.code) or "No code"
    local source = diag.source
        or (diag.user_data and diag.user_data.lsp and diag.user_data.lsp.source)
        or "Unknown source"
    local href = (
        diag.user_data
        and diag.user_data.lsp
        and diag.user_data.lsp.codeDescription
        and diag.user_data.lsp.codeDescription.href
    ) or "No documentation"

    local output =
        string.format("Diagnostic Message: %s | Code: %s | Source: %s | Reference: %s", message, code, source, href)

    vim.fn.setreg("+", output)
    print("Diagnostic copied to clipboard!")
end

vim.api.nvim_create_user_command("CopyDiagnosticMessage", function()
    M.copy_diagnostic_message()
end, { desc = "Copy diagnostic message on the current line" })

return {}

