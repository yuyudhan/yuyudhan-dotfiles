-- wezterm/wezterm.lua

-- Pull in the WezTerm API
local wezterm = require("wezterm")

-- Configuration builder for structured settings
local config = wezterm.config_builder()

-- Color scheme
-- config.color_scheme = "Batman"
config.color_scheme = 'Chalk (dark) (terminal.sexy)'

-- Font settings
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 12

-- Tab bar settings
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Window appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 6

-- Window layout and padding
config.line_height = 1.3
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- Vim-like keybindings
config.keys = {
    -- Pane navigation
    { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },

    -- Pane resizing
    { key = "H", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize { "Left", 5 } },
    { key = "J", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize { "Down", 5 } },
    { key = "K", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize { "Up", 5 } },
    { key = "L", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize { "Right", 5 } },

    -- Pane creation
    { key = "\\", mods = "CTRL", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "-", mods = "CTRL", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },

    -- Pane closing
    -- { key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentPane { confirm = true } }, -- Added Ctrl+w
    { key = "X", mods = "CTRL", action = wezterm.action.CloseCurrentPane { confirm = true } }, -- Added Ctrl+w
}

-- Return the finalized configuration
return config

