-- FilePath: nvim/lua/plugins/test.neotest.lua

return {
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
}