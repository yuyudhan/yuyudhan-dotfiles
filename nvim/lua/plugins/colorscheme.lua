-- FilePath: lua/plugins/colorscheme.lua

-- This module configures the Moonfly colorscheme for Neovim, ensuring it loads with transparency settings.
-- It applies the colorscheme immediately and sets specific highlight groups to have no background color,
-- providing a transparent look. The configuration is designed to be scalable and maintainable.

return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false, -- Load the theme immediately
        priority = 1000, -- Ensure it loads first
        config = function()
            -- Set the moonfly colorscheme
            local success, err = pcall(vim.cmd, "colorscheme moonfly")
            if not success then
                vim.notify("Failed to set colorscheme: " .. err, vim.log.levels.ERROR)
                return
            end

            -- Apply transparency by clearing background highlights
            local groups = {
                "Normal",
                "NormalNC",
                "NormalFloat",
                "LineNr",
                "SignColumn",
                "EndOfBuffer",
                "WinSeparator",
                "VertSplit",
                "StatusLine",
                "StatusLineNC",
                "CursorLine",
                "CursorLineNr",
                "Pmenu",
                "PmenuSbar",
                "PmenuSel",
                "PmenuThumb",
            }

            for _, group in ipairs(groups) do
                local success, err = pcall(vim.api.nvim_set_hl, 0, group, { bg = "NONE" })
                if not success then
                    vim.notify("Failed to set highlight for group " .. group .. ": " .. err, vim.log.levels.WARN)
                end
            end
        end,
    },
}

