-- FilePath: lua/plugins/avante.lua

--[[
    Avante Plugin Configuration
    Description:
    Configures the 'yetone/avante.nvim' plugin for Neovim, setting up AI providers, dependencies, and additional integrations
    for enhanced editor functionality, including auto-suggestions and markdown rendering.
    Functionality:
    - Primary configuration using Claude 3.5 and Claude 3.7 models
    - Configures OpenAI as an alternative provider
    - Integrates Copilot for additional auto-suggestions and side panel
    - Sets up dependencies for enhanced features like treesitter, web icons, etc.
]]

return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false, -- Always pull the latest change
        opts = {
            provider = "claude", -- Using Claude as the default provider
            auto_suggestions_provider = "claude-haiku", -- Using Claude Haiku for auto-suggestions

            -- Claude configuration for Claude 3.7 Sonnet
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-7-sonnet-20250219",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 64000,
                api_key_name = "ANTHROPIC_API_KEY", -- Environment variable for API key
            },

            deepseek = {
                debug = true,
                endpoint = "https://api.deepseek.com/v1",
                model = "deepseek-chat",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 8000,
                api_key_name = "DEEPSEEK_KEY", -- default OPENAI_API_KEY if not set
            },

            -- OpenAI configuration as alternative
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o",
                timeout = 30000, -- Timeout in milliseconds
                temperature = 0,
                max_tokens = 16000,
            },

            -- Additional providers defined as vendor extensions
            vendors = {
                -- Claude 3.5 Haiku configuration
                ["claude-haiku"] = {
                    __inherited_from = "claude",
                    model = "claude-3-5-haiku-20241022",
                    timeout = 30000,
                    temperature = 0,
                    max_tokens = 4000,
                },

                -- Claude 3.5 Sonnet configuration
                ["claude-sonnet"] = {
                    __inherited_from = "claude",
                    model = "claude-3-5-sonnet-20240620",
                    timeout = 30000,
                    temperature = 0,
                    max_tokens = 8000,
                },
            },

            -- Copilot integration
            copilot = {
                suggestion = { enabled = true }, -- Enable Copilot auto-completions
                panel = { enabled = true }, -- Enable Copilot side panel
            },

            -- Behavior settings
            behaviour = {
                auto_focus_sidebar = true,
                auto_suggestions = false, -- Disable auto suggestions initially
                auto_set_highlight_group = true,
                auto_set_keymaps = true,
                auto_apply_diff_after_generation = false,
                jump_result_buffer_on_finish = false,
                minimize_diff = true,
                enable_token_counting = true,
            },

            -- Windows layout configuration
            windows = {
                position = "right",
                wrap = true,
                width = 30,
                height = 30,
                sidebar_header = {
                    enabled = true,
                    align = "center",
                    rounded = true,
                },
            },
        },

        -- Build command
        build = "make",

        -- Dependencies
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

