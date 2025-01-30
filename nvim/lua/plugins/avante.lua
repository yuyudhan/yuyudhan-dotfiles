-- FilePath: lua/plugins/avante.lua

return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Always pull the latest change
        opts = {
            -- provider = "deepseek",
            provider = "openai",
            auto_suggestions_provider = "openai", -- Use OpenAI for auto-suggestions
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o",
                -- model = "o1-mini",
                -- model = "gpt-4o-mini",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 16000,
            },
            openaia = {
                debug = true,
                endpoint = "https://api.deepseek.com/v1",
                model = "deepseek-chat",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 8000,
                -- optional
                api_key_name = "DEEPSEEK_KEY", -- default OPENAI_API_KEY if not set
            },
        },
        build = "make", -- Build from source
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- Optional dependencies
            "nvim-tree/nvim-web-devicons", -- Optional: For icons
            {
                "zbirenbaum/copilot.lua", -- Copilot for additional auto-suggestions
                event = "VeryLazy",
                config = function()
                    require("copilot").setup({
                        suggestion = { enabled = true }, -- Enable Copilot auto-completions
                        panel = { enabled = true }, -- Enable Copilot side panel
                    })
                end,
            },
            {
                -- Support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- Required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Markdown rendering support
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}

