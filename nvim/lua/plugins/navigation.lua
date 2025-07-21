-- FilePath: nvim/lua/plugins/navigation.lua

return {
    -- Flash.nvim - Better navigation with search labels
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                char = {
                    jump_labels = true,
                },
            },
        },
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- Harpoon - Quick file navigation
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to Harpoon" })
            vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
            
            -- Quick navigation to files
            vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
            vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
            vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
            vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
            
            -- Navigate with Tab
            vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "Harpoon Next" })
            vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
        end,
    },

    -- Aerial - Code outline window
    {
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
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { desc = "Previous Symbol" })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { desc = "Next Symbol" })
        end,
    },
}