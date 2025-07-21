-- FilePath: nvim/lua/plugins/advanced-features.lua

return {
    -- UFO - Better folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async",
            "nvim-treesitter/nvim-treesitter",
        },
        event = "BufRead",
        config = function()
            -- Configure folding
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]

            -- UFO setup
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
                open_fold_hl_timeout = 150,
                close_fold_kinds = {},
                fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
                    local newVirtText = {}
                    local suffix = (" 󰁂 %d "):format(endLnum - lnum)
                    local sufWidth = vim.fn.strdisplaywidth(suffix)
                    local targetWidth = width - sufWidth
                    local curWidth = 0
                    for _, chunk in ipairs(virtText) do
                        local chunkText = chunk[1]
                        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        if targetWidth > curWidth + chunkWidth then
                            table.insert(newVirtText, chunk)
                        else
                            chunkText = truncate(chunkText, targetWidth - curWidth)
                            local hlGroup = chunk[2]
                            table.insert(newVirtText, { chunkText, hlGroup })
                            chunkWidth = vim.fn.strdisplaywidth(chunkText)
                            -- str width returned from truncate() may less than 2nd argument, need padding
                            if curWidth + chunkWidth < targetWidth then
                                suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                            end
                            break
                        end
                        curWidth = curWidth + chunkWidth
                    end
                    table.insert(newVirtText, { suffix, "MoreMsg" })
                    return newVirtText
                end,
            })

            -- Keymaps
            vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })
            vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open Folds Except Kinds" })
            vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close Folds With" })
            vim.keymap.set("n", "<leader>zk", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = "Peek Fold or Hover" })
        end,
    },

    -- Auto-session - Better session management
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
                auto_session_use_git_branch = false,
                auto_session_enable_last_session = false,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = false,
                auto_session_create_enabled = true,
                session_lens = {
                    buftypes_to_ignore = {},
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<leader>qs", require("auto-session.session-lens").search_session, { desc = "Search Sessions" })
            vim.keymap.set("n", "<leader>qS", "<cmd>SessionSave<CR>", { desc = "Save Session" })
            vim.keymap.set("n", "<leader>qr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
            vim.keymap.set("n", "<leader>qd", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })
        end,
    },

    -- Undotree - Visualize undo history
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
        },
        config = function()
            vim.g.undotree_WindowLayout = 2
            vim.g.undotree_ShortIndicators = 1
            vim.g.undotree_SetFocusWhenToggle = 1
            vim.g.undotree_DiffpanelHeight = 10
            vim.g.undotree_SplitWidth = 40
        end,
    },

    -- Better quickfix
    {
        "kevinhwang91/nvim-bqf",
        ft = "qf",
        dependencies = {
            "junegunn/fzf",
            build = function()
                vim.fn["fzf#install"]()
            end,
        },
        opts = {
            auto_enable = true,
            auto_resize_height = true,
            preview = {
                win_height = 12,
                win_vheight = 12,
                delay_syntax = 80,
                border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                show_title = false,
                should_preview_cb = function(bufnr, qwinid)
                    local ret = true
                    local bufname = vim.api.nvim_buf_get_name(bufnr)
                    local fsize = vim.fn.getfsize(bufname)
                    if fsize > 100 * 1024 then
                        -- skip file size greater than 100k
                        ret = false
                    elseif bufname:match("^fugitive://") then
                        -- skip fugitive buffer
                        ret = false
                    end
                    return ret
                end,
            },
            func_map = {
                drop = "o",
                openc = "O",
                split = "<C-s>",
                tabdrop = "<C-t>",
                tabc = "",
                ptogglemode = "z,",
                ptoggleitem = "p",
                ptoggleauto = "P",
                pscrollup = "<C-b>",
                pscrolldown = "<C-f>",
                prevfile = "<C-p>",
                nextfile = "<C-n>",
                prevhist = "<",
                nexthist = ">",
                stoggleup = "<S-Tab>",
                stoggledown = "<Tab>",
                stogglevm = "<Tab>",
                stogglebuf = "'<Tab>",
                sclear = "z<Tab>",
                filter = "zn",
                filterr = "zN",
                fzffilter = "zf",
            },
            filter = {
                fzf = {
                    action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
                    extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                },
            },
        },
    },

    -- Zen mode for distraction-free coding
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = {
                backdrop = 0.95,
                width = 120,
                height = 1,
                options = {
                    signcolumn = "no",
                    number = false,
                    relativenumber = false,
                    cursorline = false,
                    cursorcolumn = false,
                    foldcolumn = "0",
                    list = false,
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                },
                twilight = { enabled = true },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
            },
        },
        keys = {
            { "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
        },
    },

    -- Twilight - Dim inactive portions of code
    {
        "folke/twilight.nvim",
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        opts = {
            dimming = {
                alpha = 0.25,
                color = { "Normal", "#ffffff" },
                term_bg = "#000000",
                inactive = false,
            },
            context = 10,
            treesitter = true,
            expand = {
                "function",
                "method",
                "table",
                "if_statement",
            },
            exclude = {},
        },
        keys = {
            { "<leader>zt", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
        },
    },
}