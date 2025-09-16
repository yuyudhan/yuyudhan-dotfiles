-- FilePath: nvim/lua/plugins/navigation.aerial.lua

return {
    "stevearc/aerial.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("aerial").setup({
            backends = { "lsp", "treesitter", "markdown", "man" },
            layout = {
                min_width = 25,
                default_direction = "right",
            },
            attach_mode = "global",
            close_automatic_events = { "unsupported" },
            show_guides = true,
            guides = {
                mid_item = "├─",
                last_item = "└─",
                nested_top = "│ ",
                whitespace = "  ",
            },
            filter_kind = false, -- Show all symbols
        })
        
        -- Keymaps
        vim.keymap.set("n", "<leader>co", "<cmd>AerialToggle<CR>", { desc = "Toggle Code Outline" })
        vim.keymap.set("n", "<leader>cp", "<cmd>AerialPrev<CR>", { desc = "Previous Symbol" })
        vim.keymap.set("n", "<leader>cn", "<cmd>AerialNext<CR>", { desc = "Next Symbol" })
    end,
}