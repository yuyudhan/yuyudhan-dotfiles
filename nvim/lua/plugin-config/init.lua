-- nvim/lua/plugin-config/init.lua

-- Require all plugin configurations
local plugin_config = {
    "mason",          -- Mason setup for LSPs
    "treesitter",     -- Treesitter for syntax highlighting
    "lualine",        -- Statusline configuration
    "nvim-tree",      -- File explorer (Nvim-Tree)
    "toggleterm",     -- Terminal integration
    "which-key",      -- Keybinding helper
    "comment",        -- Commenting utility
    "neoscroll",      -- Smooth scrolling
    "telescope",      -- Fuzzy finder
}

-- Load each plugin configuration
for _, config in ipairs(plugin_config) do
    local ok, err = pcall(require, "plugin-config." .. config)
    if not ok then
        vim.api.nvim_err_writeln("Error loading plugin-config." .. config .. "\n\n" .. err)
    end
end

