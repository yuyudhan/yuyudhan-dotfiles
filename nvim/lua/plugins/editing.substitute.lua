-- FilePath: nvim/lua/plugins/editing.substitute.lua

return {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("substitute").setup({
            on_substitute = nil,
            yank_substituted_text = false,
            highlight_substituted_text = {
                enabled = true,
                timer = 500,
            },
            range = {
                prefix = "s",
                prompt_current_text = false,
                confirm = false,
                complete_word = false,
                motion1 = false,
                motion2 = false,
                suffix = "",
            },
            exchange = {
                motion = false,
                use_esc_to_cancel = true,
            },
        })

        -- Keymaps (using gs to avoid conflict with Flash.nvim's s)
        vim.keymap.set("n", "gs", require("substitute").operator, { desc = "Substitute" })
        vim.keymap.set("n", "gss", require("substitute").line, { desc = "Substitute Line" })
        vim.keymap.set("n", "gS", require("substitute").eol, { desc = "Substitute to EOL" })
        vim.keymap.set("x", "gs", require("substitute").visual, { desc = "Substitute" })
        
        vim.keymap.set("n", "<leader>s", require("substitute.range").operator, { desc = "Substitute Range" })
        vim.keymap.set("x", "<leader>s", require("substitute.range").visual, { desc = "Substitute Range" })
        vim.keymap.set("n", "<leader>ss", require("substitute.range").word, { desc = "Substitute Word Range" })
        
        vim.keymap.set("n", "sx", require("substitute.exchange").operator, { desc = "Exchange" })
        vim.keymap.set("n", "sxx", require("substitute.exchange").line, { desc = "Exchange Line" })
        vim.keymap.set("x", "X", require("substitute.exchange").visual, { desc = "Exchange" })
        vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { desc = "Cancel Exchange" })
    end,
}