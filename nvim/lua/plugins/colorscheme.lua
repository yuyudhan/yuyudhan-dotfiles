-- FilePath: lua/plugins/colorscheme.lua

return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false, -- Load the theme immediately
        priority = 1000, -- Ensure it loads first
        config = function()
            vim.cmd("colorscheme moonfly") -- Set the moonfly colorscheme

            -- Apply transparency by clearing background highlights
            local groups = {
                "Normal", -- Main background
                "NormalNC", -- Non-current windows
                "NormalFloat", -- Floating windows
                "LineNr", -- Line numbers
                "SignColumn", -- Sign column (git signs, diagnostics)
                "EndOfBuffer", -- End of buffer lines
                "WinSeparator", -- Window separators
                "VertSplit", -- Vertical split lines
                "StatusLine", -- Status line
                "StatusLineNC", -- Non-current window's status line
                "CursorLine", -- Highlighted current line
                "CursorLineNr", -- Line number of the current line
                "Pmenu", -- Popup menu
                "PmenuSbar", -- Popup menu scrollbar
                "PmenuSel", -- Popup menu selected item
                "PmenuThumb", -- Popup menu scrollbar thumb
            }

            for _, group in ipairs(groups) do
                vim.api.nvim_set_hl(0, group, { bg = "NONE" })
            end
        end,
    },
}

