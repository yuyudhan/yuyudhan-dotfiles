-- FilePath: nvim/lua/plugins/keybindings.lua

return {
    -- Which-key - Show keybindings in a popup
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            plugins = {
                marks = true,
                registers = true,
                spelling = {
                    enabled = true,
                    suggestions = 20,
                },
                presets = {
                    operators = true,
                    motions = true,
                    text_objects = true,
                    windows = true,
                    nav = true,
                    z = true,
                    g = true,
                },
            },
            key_labels = {
                ["<space>"] = "SPC",
                ["<cr>"] = "RET",
                ["<tab>"] = "TAB",
            },
            icons = {
                breadcrumb = "»",
                separator = "➜",
                group = "+",
            },
            popup_mappings = {
                scroll_down = "<c-d>",
                scroll_up = "<c-u>",
            },
            window = {
                border = "rounded",
                position = "bottom",
                margin = { 1, 0, 1, 0 },
                padding = { 2, 2, 2, 2 },
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 },
                width = { min = 20, max = 50 },
                spacing = 3,
                align = "center",
            },
            ignore_missing = false,
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
            show_help = true,
            show_keys = true,
            triggers = "auto",
            triggers_blacklist = {
                i = { "j", "k" },
                v = { "j", "k" },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            
            -- Register key groups
            wk.register({
                ["<leader>"] = {
                    b = { name = "+buffer" },
                    c = { name = "+code" },
                    f = { name = "+file/find" },
                    g = { name = "+git" },
                    h = { name = "+harpoon" },
                    m = { name = "+mason" },
                    o = { name = "+overseer/outline" },
                    q = { name = "+quit/session" },
                    r = { name = "+rename/refactor" },
                    s = { name = "+search/substitute/split" },
                    t = { name = "+test/toggle/tmux" },
                    u = { name = "+ui" },
                    w = { name = "+windows" },
                    x = { name = "+diagnostics/quickfix" },
                    z = { name = "+custom/zen" },
                },
                g = {
                    name = "+goto",
                },
            })
        end,
    },

    -- Legendary - Command palette
    {
        "mrjones2014/legendary.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        priority = 10000,
        lazy = false,
        opts = {
            extensions = {
                lazy_nvim = true,
                which_key = {
                    auto_register = true,
                },
            },
        },
        keys = {
            { "<C-S-p>", "<cmd>Legendary<cr>", desc = "Command Palette" },
        },
    },
}