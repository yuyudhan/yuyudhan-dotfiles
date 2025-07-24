-- FilePath: nvim/lua/plugins/diagnostics.trouble.lua

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
        use_diagnostic_signs = true,
        auto_open = false,
        auto_close = false,
    },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
        { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
    },
}