-- FilePath: nvim/lua/plugins/git.diffview.lua

return {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
        { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
    },
}