-- FilePath: lua/plugins/mini-nvim.lua
--
-- This file configures the Mini.nvim suite of plugins, providing essential text editing functionality including textobjects, alignment, commenting, movement, and surround actions with minimal overhead.

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
            require("mini.indentscope").setup({
                symbol = "│", -- Customize the symbol for the scope
                options = { try_as_border = true },
            }) -- Visualize and work with indent scope

            -- GENERAL WORKFLOW MODULES
            require("mini.bufremove").setup() -- Remove buffers without closing windows
        end,
    },
}