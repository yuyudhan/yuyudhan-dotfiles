-- lua/yuyudhan/plugin-config/yazi.lua

local status_ok, yazi = pcall(require, "yazi")
if not status_ok then
    vim.notify("Yazi.nvim plugin is not installed", vim.log.levels.ERROR)
    return
end

yazi.setup({
    -- Specify the path to the Yazi binary (if needed)
    yazi_bin = "/usr/local/bin/yazi", -- Adjust the path if Yazi is installed elsewhere

    -- Default keymap to open Yazi
    keymap = "<leader>fy", -- Change as per your preference

    -- Optional: Additional Yazi settings
    options = {
        hidden = true, -- Show hidden files by default
        sort = "name", -- Sorting: 'name', 'size', 'modified'
    },
})

