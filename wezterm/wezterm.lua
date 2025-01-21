--  FilePath: wezterm/wezterm.lua

-- Pull in the WezTerm API
local wezterm = require("wezterm")

-- Configuration builder for structured settings
local config = wezterm.config_builder()

-- ================================
-- Appearance Settings
-- ================================

-- Color scheme
config.color_scheme = "Chalk (dark) (terminal.sexy)"

-- Font settings
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

-- Window appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 0

-- Window border settings
config.window_frame = {
	-- Title bar colors
	active_titlebar_bg = "#1D1F21", -- Active window title bar color
	inactive_titlebar_bg = "#282A2E", -- Inactive window title bar color

	-- Border widths
	border_left_width = 2,
	border_right_width = 3,
	border_top_height = 2,
	border_bottom_height = 2,

	-- Border colors
	border_left_color = "#44475A",
	border_right_color = "#44475A",
	border_top_color = "#44475A",
	border_bottom_color = "#44475A",
}

-- Window padding
config.line_height = 1.2
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- ================================
-- Tab Bar Settings
-- ================================

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- ================================
-- Key Bindings
-- ================================

config.keys = {
	-- Clear Scrollback and Screen with Cmd + K (Mac)
	{
		key = "K",
		mods = "CMD",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},

	-- Clear Scrollback and Screen with Ctrl + L (Linux/Windows/Mac)
	{
		key = "L",
		mods = "CTRL",
		action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
	},

	-- Pane navigation (Vim-like)
	{ key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },

	-- Pane resizing
	{ key = "H", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "J", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "K", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "L", mods = "CTRL|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },

	-- Pane creation
	{ key = "\\", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Pane closing
	{ key = "X", mods = "CTRL", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

-- Return the finalized configuration
return config

