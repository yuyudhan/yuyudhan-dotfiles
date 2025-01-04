-- lua/whichkey.lua

require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
}

require('which-key').setup({
    plugins = {
        spelling = {
            enabled = true,
            suggestions = 20,
        },
    },
    layout = {
        spacing = 6,
        align = "center",
    },
    window = {
        border = "rounded",
        position = "bottom",
    },
})

-- Optionally, load leader mappings
require('mappings.leader')

