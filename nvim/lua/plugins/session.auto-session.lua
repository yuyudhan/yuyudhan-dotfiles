-- FilePath: nvim/lua/plugins/session.auto-session.lua

return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            auto_session_use_git_branch = false,
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = true,
            auto_restore_enabled = false,
            auto_session_create_enabled = true,
            session_lens = {
                buftypes_to_ignore = {},
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>qs", require("auto-session.session-lens").search_session, { desc = "Search Sessions" })
        vim.keymap.set("n", "<leader>qS", "<cmd>SessionSave<CR>", { desc = "Save Session" })
        vim.keymap.set("n", "<leader>qr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
        vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })
    end,
}