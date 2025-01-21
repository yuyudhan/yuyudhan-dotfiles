-- FilePath: lua/plugins/avante.lua

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = {
        -- Core Configuration
        provider = "openai",
        -- provider = "claude",
        auto_suggestions_provider = "claude", -- Use Claude for auto-suggestions

        -- Provider Settings
        openai = {
            endpoint = "https://api.openai.com/v1",
            -- model = "gpt-4o-mini", -- Use GPT-4o for OpenAI
            model = "gpt-4o-2024-08-06",
            -- model = "openai/gpt-4o-2024-08-06",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8192,
            -- Add other OpenAI-specific configurations if needed
        },

        -- openai = {
        --     endpoint = "https://openrouter.ai/api",
        --     model = "openai/gpt-4o-2024-08-06",
        --     temperature = 0,
        --     max_tokens = 4096,
        -- },

        claude = {
            endpoint = "https://api.anthropic.com",
            -- model = "claude-3.5", -- Use Claude 3.5
            model = "claude-3-5-sonnet-20241022",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8000,
            -- Add other Claude-specific configurations if needed
        },

        -- Disable Unused Providers (Optional)
        azure = nil,
        copilot = nil,
        gemini = nil,
        vertex = nil,
        cohere = nil,

        -- Behavior Configuration
        behaviour = {
            auto_focus_sidebar = true,
            auto_suggestions = true, -- Experimental stage
            auto_suggestions_respect_ignore = false,
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = true, -- Enable image pasting
            minimize_diff = true,
        },

        -- History Configuration
        history = {
            max_tokens = 4096,
            storage_path = vim.fn.stdpath("state") .. "/avante",
            paste = {
                extension = "png",
                filename = "pasted-%Y-%m-%d-%H-%M-%S",
            },
        },

        -- Highlights Configuration
        highlights = {
            diff = {
                current = "DiffText",
                incoming = "DiffAdd",
            },
        },

        -- Mappings Configuration
        mappings = {
            diff = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            suggestion = {
                accept = "<M-l>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
            },
            jump = {
                next = "]]",
                prev = "[[",
            },
            submit = {
                normal = "<CR>",
                insert = "<C-s>",
            },
            -- Safe keymaps set by avante.nvim
            ask = "<leader>aa",
            edit = "<leader>ae",
            refresh = "<leader>ar",
            focus = "<leader>af",
            toggle = {
                default = "<leader>at",
                debug = "<leader>ad",
                hint = "<leader>ah",
                suggestion = "<leader>as",
                repomap = "<leader>aR",
            },
            sidebar = {
                apply_all = "A",
                apply_cursor = "a",
                switch_windows = "<Tab>",
                reverse_switch_windows = "<S-Tab>",
                remove_file = "d",
                add_file = "@",
            },
            files = {
                add_current = "<leader>ac", -- Add current buffer to selected files
            },
        },

        -- Windows Configuration
        windows = {
            position = "right", -- Position of the sidebar
            wrap = true, -- Enable line wrapping
            width = 30, -- Width of the sidebar
            height = 30, -- Height of horizontal layout windows
            sidebar_header = {
                enabled = true, -- Enable header
                align = "center", -- Center align the header
                rounded = true, -- Rounded borders for the header
            },
            input = {
                prefix = "> ",
                height = 8, -- Height of the input window in vertical layout
            },
            edit = {
                border = "rounded",
                floating = true,
                start_insert = true, -- Start in insert mode
            },
            ask = {
                floating = false, -- Open in non-floating window
                border = "rounded",
                start_insert = true, -- Start in insert mode
                focus_on_apply = "ours", -- Focus on 'ours' diff after applying
            },
        },

        -- Diff Configuration
        diff = {
            autojump = true,
            override_timeoutlen = 500, -- Override timeoutlen to avoid operator-pending mode
            mappings = {
                ours = "co",
                theirs = "ct",
                all_theirs = "ca",
                both = "cb",
                cursor = "cc",
                next = "]x",
                prev = "[x",
            },
            highlights = {
                current = "DiffText",
                incoming = "DiffAdd",
            },
        },

        -- Hints Configuration
        hints = {
            enabled = true,
        },

        -- Repo Map Configuration
        repo_map = {
            ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- Ignore these files
            negate_patterns = {}, -- No negate patterns
        },

        -- File Selector Configuration
        file_selector = {
            provider = "native", -- Use native file selector
            provider_opts = {}, -- No additional options
        },

        -- Suggestion Configuration
        suggestion = {
            debounce = 600,
            throttle = 600,
        },

        -- Dual Boost Configuration (Optional)
        dual_boost = {
            enabled = false, -- Disable dual boost mode
            first_provider = "openai",
            second_provider = "claude",
            prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
            timeout = 60000, -- Timeout in milliseconds
        },
    },
    -- Build Configuration
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows

    -- Dependencies
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "hrsh7th/nvim-cmp", -- Autocompletion for avante commands and mentions
        "nvim-tree/nvim-web-devicons", -- Or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- For providers='copilot'
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
            -- Render Markdown Support
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}

