-- lua/plugins/aider.lua
return {
    "joshuavial/aider.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    event = "VeryLazy", -- Lazy load for better performance
    config = function()
        require("aider").setup({
            -- Optional: Customize settings here
            keymaps = {
                open_chat = "<leader>aa", -- Open Aider chat
                ask_code = "<leader>ac", -- Ask for code suggestions
            },
            ui = {
                border = "rounded", -- Nice rounded floating windows
                layout = "vertical", -- Vertical split layout
            },
        })
    end,
}

