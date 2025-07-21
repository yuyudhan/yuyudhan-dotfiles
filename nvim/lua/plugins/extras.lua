-- FilePath: nvim/lua/plugins/extras.lua

return {
    -- Telescope frecency - Smart file picking
    {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        config = function()
            require("telescope").load_extension("frecency")
        end,
        keys = {
            { "<leader>fr", "<cmd>Telescope frecency<cr>", desc = "Recent Files (Frecency)" },
        },
    },

    -- Telescope fzf native - Better performance
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },

    -- Neotest - Run tests from Neovim
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/nvim-nio",
            -- Test adapters
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-jest",
            "rouge8/neotest-rust",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-go"),
                    require("neotest-python")({
                        dap = { justMyCode = false },
                    }),
                    require("neotest-jest")({
                        jestCommand = "npm test --",
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(path)
                            return vim.fn.getcwd()
                        end,
                    }),
                    require("neotest-rust"),
                },
                status = {
                    enabled = true,
                    signs = true,
                    virtual_text = true,
                },
                icons = {
                    expanded = "",
                    child_prefix = "├",
                    child_indent = "│",
                    final_child_prefix = "└",
                    non_collapsible = "─",
                    passed = "",
                    running = "",
                    failed = "",
                    unknown = "",
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>tt", function() require("neotest").run.run() end, { desc = "Run Nearest Test" })
            vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run Test File" })
            vim.keymap.set("n", "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "Debug Test" })
            vim.keymap.set("n", "<leader>ts", function() require("neotest").run.stop() end, { desc = "Stop Test" })
            vim.keymap.set("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to Test" })
            vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Test Output" })
            vim.keymap.set("n", "<leader>tO", function() require("neotest").output_panel.toggle() end, { desc = "Toggle Output Panel" })
            vim.keymap.set("n", "<leader>tS", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary" })
        end,
    },

    -- Diffview - Better git diffs
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
        config = true,
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
            { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
            { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Branch History" },
        },
    },

    -- Overseer - Task runner
    {
        "stevearc/overseer.nvim",
        opts = {
            templates = { "builtin" },
            strategy = {
                "terminal",
                use_shell = true,
            },
            task_list = {
                direction = "bottom",
                min_height = 10,
                max_height = 20,
                default_detail = 1,
            },
        },
        keys = {
            { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task" },
            { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },
            { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
            { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Task Info" },
        },
    },

    -- Markdown preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        keys = {
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
        },
    },

    -- Better escape
    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup({
                mappings = {
                    i = {
                        j = {
                            k = "<Esc>",
                            j = "<Esc>",
                        },
                    },
                    c = {
                        j = {
                            k = "<Esc>",
                            j = "<Esc>",
                        },
                    },
                    t = {
                        j = {
                            k = "<Esc>",
                            j = "<Esc>",
                        },
                    },
                    v = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                    s = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                },
                timeout = vim.o.timeoutlen,
                clear_empty_lines = false,
            })
        end,
    },

    -- Persistence - Better session management than auto-session for some use cases
    -- Disabled: Using auto-session instead for more features
    -- {
    --     "folke/persistence.nvim",
    --     event = "BufReadPre",
    --     opts = {
    --         dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    --         options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
    --         pre_save = nil,
    --         save_empty = false,
    --     },
    --     keys = {
    --         { "<leader>qp", function() require("persistence").load() end, desc = "Restore Session" },
    --         { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    --         { "<leader>qQ", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    --     },
    -- },
}