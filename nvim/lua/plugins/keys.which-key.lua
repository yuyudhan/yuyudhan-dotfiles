-- FilePath: nvim/lua/plugins/keys.which-key.lua

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        preset = "modern",
        delay = 300,
        filter = function(mapping)
            return true
        end,
        spec = {
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file/find" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "harpoon" },
            { "<leader>m", group = "mason" },
            { "<leader>o", group = "overseer/outline" },
            { "<leader>q", group = "quit/session" },
            { "<leader>r", group = "rename/refactor" },
            { "<leader>s", group = "search/substitute/split" },
            { "<leader>t", group = "test/toggle/tmux" },
            { "<leader>u", group = "ui" },
            { "<leader>w", group = "windows" },
            { "<leader>x", group = "diagnostics/quickfix" },
            { "<leader>z", group = "custom/zen" },
            { "g", group = "goto" },
        },
        keys = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
        win = {
            border = "rounded",
            padding = { 1, 2 },
        },
        replace = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
            ellipsis = "…",
            mappings = true,
            rules = {},
            colors = true,
            keys = {
                Up = " ",
                Down = " ",
                Left = " ",
                Right = " ",
                C = "󰘴 ",
                M = "󰘵 ",
                D = "󰘳 ",
                S = "󰘶 ",
                CR = "󰌑 ",
                Esc = "󱊷 ",
                ScrollWheelDown = "󱕐 ",
                ScrollWheelUp = "󱕑 ",
                NL = "󰌑 ",
                BS = "󰁮",
                Space = "󱁐 ",
                Tab = "󰌒 ",
                F1 = "󱊫",
                F2 = "󱊬",
                F3 = "󱊭",
                F4 = "󱊮",
                F5 = "󱊯",
                F6 = "󱊰",
                F7 = "󱊱",
                F8 = "󱊲",
                F9 = "󱊳",
                F10 = "󱊴",
                F11 = "󱊵",
                F12 = "󱊶",
            },
        },
        show_help = true,
        show_keys = true,
        disable = {
            bt = {},
            ft = {},
        },
        debug = false,
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
    end,
}