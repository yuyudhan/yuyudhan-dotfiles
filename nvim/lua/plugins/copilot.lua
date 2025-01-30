--  FilePath: lua/plugins/copilot.lua

return {
    {
        "github/copilot.vim",
        config = function()
            -- Copilot configuration
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.g.copilot_filetypes = {
                ["*"] = true,
                ["markdown"] = true,
                ["yaml"] = true,
                ["json"] = true,
                ["toml"] = true,
                ["typescript"] = true,
                ["javascript"] = true,
                ["lua"] = true,
                ["rust"] = true,
                ["go"] = true,
                ["python"] = true,
                ["cpp"] = true,
                ["c"] = true,
            }
        end,
    },
}

