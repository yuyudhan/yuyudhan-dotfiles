-- nvim/lua/plugin-config/telescope.lua

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = actions.close, -- Close Telescope with Esc in insert mode
            },
        },
        layout_config = {
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
    },
})

-- Load Telescope extensions
require("telescope").load_extension("fzf")

