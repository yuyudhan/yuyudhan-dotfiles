-- FilePath: nvim/lua/plugins/focus.twilight.lua

return {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    opts = {
        dimming = {
            alpha = 0.25,
            color = { "Normal", "#ffffff" },
            term_bg = "#000000",
            inactive = false,
        },
        context = 10,
        treesitter = true,
        expand = {
            "function",
            "method",
            "table",
            "if_statement",
        },
        exclude = {},
    },
    keys = {
        { "<leader>zt", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
    },
}