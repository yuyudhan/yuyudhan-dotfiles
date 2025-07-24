-- FilePath: nvim/lua/plugins/editing.treesj.lua

return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("treesj").setup({
            use_default_keymaps = false,
            check_syntax_error = true,
            max_join_length = 120,
            cursor_behavior = "hold",
            notify = true,
            langs = {},
        })
        
        vim.keymap.set("n", "<leader>sj", require("treesj").toggle, { desc = "Split/Join Code Block" })
        vim.keymap.set("n", "<leader>ss", require("treesj").split, { desc = "Split Code Block" })
        vim.keymap.set("n", "<leader>sJ", require("treesj").join, { desc = "Join Code Block" })
    end,
}