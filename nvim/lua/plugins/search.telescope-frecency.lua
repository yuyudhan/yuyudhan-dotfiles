-- FilePath: nvim/lua/plugins/search.telescope-frecency.lua

return {
    "nvim-telescope/telescope-frecency.nvim",
    dependencies = { "kkharji/sqlite.lua" },
    config = function()
        require("telescope").load_extension("frecency")
    end,
    keys = {
        { "<leader>fr", "<cmd>Telescope frecency<cr>", desc = "Recent Files (Frecency)" },
    },
}