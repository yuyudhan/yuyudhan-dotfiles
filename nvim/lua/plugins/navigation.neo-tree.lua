-- FilePath: lua/plugins/neo-tree.lua

return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true, -- Show hidden files by default
                hide_dotfiles = false, -- Do not hide dotfiles (files starting with .)
                hide_gitignored = false, -- Optionally show git-ignored files
            },
        },
    },
}

