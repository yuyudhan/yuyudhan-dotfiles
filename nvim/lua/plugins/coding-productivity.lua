-- FilePath: nvim/lua/plugins/coding-productivity.lua

return {
    -- Trouble - Pretty diagnostics, references, telescope results, quickfix and location list
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        cmd = { "TroubleToggle", "Trouble" },
        opts = {
            use_diagnostic_signs = true,
            auto_open = false,
            auto_close = false,
        },
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
            { "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>", desc = "LSP References" },
        },
    },

    -- Glance - Preview definitions and references
    {
        "dnlhc/glance.nvim",
        config = function()
            local glance = require("glance")
            local actions = glance.actions

            glance.setup({
                height = 18,
                zindex = 45,
                preview_win_opts = {
                    cursorline = true,
                    number = true,
                    wrap = true,
                },
                border = {
                    enable = true,
                    top_char = "―",
                    bottom_char = "―",
                },
                list = {
                    position = "right",
                    width = 0.33,
                },
                theme = {
                    enable = true,
                    mode = "auto",
                },
                mappings = {
                    list = {
                        ["j"] = actions.next,
                        ["k"] = actions.previous,
                        ["<Down>"] = actions.next,
                        ["<Up>"] = actions.previous,
                        ["<Tab>"] = actions.next_location,
                        ["<S-Tab>"] = actions.previous_location,
                        ["<C-u>"] = actions.preview_scroll_win(5),
                        ["<C-d>"] = actions.preview_scroll_win(-5),
                        ["v"] = actions.jump_vsplit,
                        ["s"] = actions.jump_split,
                        ["t"] = actions.jump_tab,
                        ["<CR>"] = actions.jump,
                        ["o"] = actions.jump,
                        ["<leader>l"] = actions.enter_win("preview"),
                        ["q"] = actions.close,
                        ["Q"] = actions.close,
                        ["<Esc>"] = actions.close,
                    },
                    preview = {
                        ["Q"] = actions.close,
                        ["<Tab>"] = actions.next_location,
                        ["<S-Tab>"] = actions.previous_location,
                        ["<leader>l"] = actions.enter_win("list"),
                    },
                },
                hooks = {},
                folds = {
                    fold_closed = "",
                    fold_open = "",
                    folded = true,
                },
                indent_lines = {
                    enable = true,
                    icon = "│",
                },
                winbar = {
                    enable = true,
                },
            })

            -- Keymaps
            vim.keymap.set("n", "gD", "<CMD>Glance definitions<CR>", { desc = "Glance Definitions" })
            vim.keymap.set("n", "gR", "<CMD>Glance references<CR>", { desc = "Glance References" })
            vim.keymap.set("n", "gY", "<CMD>Glance type_definitions<CR>", { desc = "Glance Type Definitions" })
            vim.keymap.set("n", "gM", "<CMD>Glance implementations<CR>", { desc = "Glance Implementations" })
        end,
    },

    -- Inc-rename - Live preview of rename operations
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({
                cmd_name = "IncRename",
                hl_group = "Substitute",
                preview_empty_name = false,
                show_message = true,
                input_buffer_type = nil,
                post_hook = nil,
            })
            
            vim.keymap.set("n", "<leader>rn", function()
                return ":IncRename " .. vim.fn.expand("<cword>")
            end, { expr = true, desc = "Incremental Rename" })
        end,
    },

    -- Refactoring - Extract functions, variables, and more
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup({
                prompt_func_return_type = {
                    go = true,
                    java = true,
                    cpp = true,
                    c = true,
                    h = true,
                    hpp = true,
                    cxx = true,
                },
                prompt_func_param_type = {
                    go = true,
                    java = true,
                    cpp = true,
                    c = true,
                    h = true,
                    hpp = true,
                    cxx = true,
                },
                printf_statements = {},
                print_var_statements = {},
            })

            -- Keymaps
            vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Extract Function" })
            vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract to File" })
            vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract Variable" })
            vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var<CR>", { desc = "Inline Variable" })
            vim.keymap.set("n", "<leader>rI", ":Refactor inline_func<CR>", { desc = "Inline Function" })
            vim.keymap.set("n", "<leader>rb", ":Refactor extract_block<CR>", { desc = "Extract Block" })
            vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file<CR>", { desc = "Extract Block to File" })
        end,
    },

    -- Treesj - Smart split/join for code blocks
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("treesj").setup({
                use_default_keymaps = false,
                check_syntax_error = true,
                max_join_length = 120,
                cursor_behavior = "hold",
                notify = true,
                langs = {},
            })
            
            vim.keymap.set("n", "<leader>sj", require("treesj").toggle, { desc = "Split/Join Code Block" })
            vim.keymap.set("n", "<leader>ss", require("treesj").split, { desc = "Split Code Block" })
            vim.keymap.set("n", "<leader>sJ", require("treesj").join, { desc = "Join Code Block" })
        end,
    },

    -- Substitute - Better substitute with preview
    {
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
    },
}