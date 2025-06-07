-- FilePath: lua/plugins/avante.lua

--[[
    Avante Plugin Configuration - Claude 3.7 Optimized Setup
    Description:
    Configures the 'yetone/avante.nvim' plugin for Neovim using Claude 3.7 Sonnet
    as the primary provider for code editing and conversations.
    Functionality:
    - Claude 3.7 Sonnet for main code edits and conversations ($3/$15 per MTok)
    - Claude Haiku for cost-effective autocompletion ($0.25/$1.25 per MTok)
    - DeepSeek as ultra-cheap backup option
    - Additional Claude variants for different use cases
    - Integrates Copilot for additional code completion
    - Sets up dependencies for enhanced features like treesitter, web icons
    - Supports image pasting and markdown rendering
]]

return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Always pull the latest change
        opts = {
            provider = "claude", -- Use claude as primary provider (Claude 3.7)
            auto_suggestions_provider = "claude-haiku", -- Use cheap Haiku for autocompletion

            -- Base Claude configuration - Claude 3.7 Sonnet
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-7-sonnet-20250219", -- Claude 3.7 Sonnet for coding
                timeout = 30000,
                temperature = 0,
                max_tokens = 8000,
                api_key_name = "ANTHROPIC_API_KEY",
            },

            -- Additional vendor configurations
            vendors = {
                -- DeepSeek as backup option
                deepseek = {
                    __inherited_from = "openai",
                    api_key_name = "DEEPSEEK_API_KEY",
                    endpoint = "https://api.deepseek.com",
                    model = "deepseek-coder",
                    max_tokens = 8192,
                },

                -- Claude Haiku for fast/cheap operations
                ["claude-haiku"] = {
                    __inherited_from = "claude",
                    model = "claude-3-haiku-20240307",
                    timeout = 15000,
                    temperature = 0,
                    max_tokens = 4000,
                },

                -- Claude 3.5 Haiku for mid-tier operations
                ["claude-3-5-haiku"] = {
                    __inherited_from = "claude",
                    model = "claude-3-5-haiku-20241022",
                    timeout = 15000,
                    temperature = 0,
                    max_tokens = 4000,
                },

                -- Claude 3.7 Sonnet - optimized for coding ($3/$15 per MTok)
                ["claude-3-7-sonnet"] = {
                    __inherited_from = "claude",
                    model = "claude-3-7-sonnet-20250219",
                    timeout = 30000,
                    temperature = 0,
                    max_tokens = 8000,
                },
            },
        },

        -- Build command - this is crucial for the plugin to work
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows

        -- Dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- Support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- Recommended settings
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

