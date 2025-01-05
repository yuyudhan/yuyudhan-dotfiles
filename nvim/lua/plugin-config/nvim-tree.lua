-- nvim/lua/plugin-config/nvim-tree.lua

require("nvim-tree").setup({
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
            },
        },
    },
    view = {
        width = 30,
        side = "left",
    },
})

