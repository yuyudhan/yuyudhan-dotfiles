-- nvim/lua/plugin-config/toggleterm.lua

require("toggleterm").setup({
    size = 20,
    open_mapping = [[<leader>tt]], -- Map <leader>tt to toggle the terminal
    direction = "float",
    float_opts = {
        border = "curved",
    },
})

