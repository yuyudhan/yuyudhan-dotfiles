-- FilePath: nvim/lua/plugins/history.undotree.lua

return {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
        { "<leader>ut", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    config = function()
        vim.g.undotree_WindowLayout = 2
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.g.undotree_DiffpanelHeight = 10
        vim.g.undotree_SplitWidth = 40
    end,
}