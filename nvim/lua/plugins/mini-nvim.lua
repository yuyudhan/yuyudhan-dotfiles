--  FilePath: lua/plugins/mini-nvim.lua

-- FilePath: lua/plugins/mini-nvim.lua

return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            -- ESSENTIAL MODULES
            require("mini.ai").setup() -- Extend and create a/i textobjects
            require("mini.align").setup() -- Align text interactively
            require("mini.comment").setup() -- Comment lines (integrates well with LazyVim)
            require("mini.move").setup() -- Move any selection in any direction
            require("mini.surround").setup() -- Surround actions (better than alternatives)

            -- APPEARANCE MODULES
            -- require("mini.animate").setup() -- Animate common Neovim actions

            require("mini.indentscope").setup({
                symbol = "│", -- Customize the symbol for the scope
                options = { try_as_border = true },
            }) -- Visualize and work with indent scope

            -- GENERAL WORKFLOW MODULES
            require("mini.bufremove").setup() -- Remove buffers without closing windows
        end,
    },
}

-- File: lua/plugins/mini-nvim.lua
-- return
--  c   {
--         "echasnovski/mini.nvim",
--         version = "*",
--         config = function()
--             -- TEXT EDITING MODULES
--             require("mini.ai").setup() -- Extend and create a/i textobjects
--             require("mini.align").setup() -- Align text interactively
--             require("mini.comment").setup() -- Comment lines
--             require("mini.move").setup() -- Move any selection in any direction
--             require("mini.operators").setup() -- Text edit operators
--             require("mini.pairs").setup() -- Autopairs
--             -- require("mini.snippets").setup() -- Manage and expand snippets
--             require("mini.splitjoin").setup() -- Split and join arguments
--             require("mini.surround").setup() -- Surround actions
--
--             -- GENERAL WORKFLOW MODULES
--             require("mini.basics").setup() -- Common configuration presets
--             require("mini.bracketed").setup() -- Go forward/backward with square brackets
--             require("mini.bufremove").setup() -- Remove buffers
--             require("mini.clue").setup() -- Show next key clues
--             require("mini.diff").setup() -- Work with diff hunks
--             require("mini.files").setup() -- Navigate and manipulate file system
--             require("mini.jump").setup() -- Jump to next/previous single character
--             require("mini.jump2d").setup() -- Jump within visible lines
--             require("mini.pick").setup() -- Pick anything
--             require("mini.sessions").setup() -- Session management
--             require("mini.visits").setup() -- Track and reuse file system visits
--
--             -- APPEARANCE MODULES
--             require("mini.animate").setup() -- Animate common Neovim actions
--             require("mini.base16").setup() -- Base16 colorscheme creation
--             require("mini.colors").setup() -- Tweak and save any color scheme
--             require("mini.cursorword").setup() -- Autohighlight word under cursor
--             require("mini.hipatterns").setup() -- Highlight patterns in text
--             require("mini.hues").setup() -- Generate configurable color scheme
--             require("mini.icons").setup() -- Icon provider
--             require("mini.indentscope").setup({
--                 symbol = "│",
--                 options = { try_as_border = true },
--             }) -- Visualize and work with indent scope
--             require("mini.map").setup() -- Window with buffer text overview
--             require("mini.notify").setup() -- Show notifications
--             require("mini.starter").setup({
--                 evaluate_single = true,
--                 items = {
--                     { name = "Open file", action = "Telescope find_files" },
--                     { name = "Recent files", action = "Telescope oldfiles" },
--                     { name = "New file", action = "ene!" },
--                 },
--             }) -- Start screen
--             require("mini.statusline").setup() -- Statusline
--             require("mini.tabline").setup() -- Tabline
--             require("mini.trailspace").setup() -- Trailspace (highlight and remove)
--
--             -- OTHER MODULES
--             require("mini.doc").setup() -- Generate Neovim help files
--             require("mini.fuzzy").setup() -- Fuzzy matching
--             require("mini.test").setup() -- Test Neovim plugins
--         end,
--     },
-- }

