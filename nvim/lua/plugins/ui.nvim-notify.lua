-- FilePath: nvim/lua/plugins/ui.nvim-notify.lua

return {
    "rcarriga/nvim-notify",
    opts = {
        timeout = 3000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        stages = "fade_in_slide_out",
        render = "default",
        background_colour = "#1a1b26",
    },
}