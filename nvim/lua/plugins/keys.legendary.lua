-- FilePath: nvim/lua/plugins/keys.legendary.lua

return {
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
}