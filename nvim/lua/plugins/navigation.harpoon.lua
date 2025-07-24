-- FilePath: nvim/lua/plugins/navigation.harpoon.lua

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add to Harpoon" })
        vim.keymap.set("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })
        
        -- Quick navigation to files
        vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
        vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
        vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
        vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
        
        -- Navigate with Tab
        vim.keymap.set("n", "<Tab>", function() harpoon:list():next() end, { desc = "Harpoon Next" })
        vim.keymap.set("n", "<S-Tab>", function() harpoon:list():prev() end, { desc = "Harpoon Previous" })
    end,
}