-- FilePath: nvim/lua/plugins/refactoring.refactoring.lua

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup({
            prompt_func_return_type = {
                go = true,
                java = true,
                cpp = true,
                c = true,
                h = true,
                hpp = true,
                cxx = true,
            },
            prompt_func_param_type = {
                go = true,
                java = true,
                cpp = true,
                c = true,
                h = true,
                hpp = true,
                cxx = true,
            },
            printf_statements = {},
            print_var_statements = {},
        })

        -- Keymaps
        vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Extract Function" })
        vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to File" })
        vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract Variable" })
        vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var<CR>", { desc = "Inline Variable" })
        vim.keymap.set("n", "<leader>rI", ":Refactor inline_func<CR>", { desc = "Inline Function" })
        vim.keymap.set("n", "<leader>rb", ":Refactor extract_block<CR>", { desc = "Extract Block" })
        vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>", { desc = "Extract Block to File" })
    end,
}