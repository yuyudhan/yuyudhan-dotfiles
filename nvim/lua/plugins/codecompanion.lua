return {
    {
        "olimorris/codecompanion.nvim",
        config = function()
            -- Import the logger from plenary for debugging and info messages
            local logger = require("plenary.log").new({ plugin = "codecompanion", level = "debug" })
            logger.info("Initializing CodeCompanion configuration")

            -- Setup CodeCompanion with custom settings
            require("codecompanion").setup({
                adapters = {
                    chat = "anthropic",
                    inline = "copilot",
                },
            })
            logger.info("CodeCompanion setup completed successfully")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim", -- Required for logging and utility functions
            "nvim-treesitter/nvim-treesitter", -- Syntax parsing support
        },
    },
}

