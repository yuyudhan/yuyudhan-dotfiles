-- FilePath: wezterm/wezterm.lua

local wezterm = require("wezterm")

-- Configuration builder for structured settings
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

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
config.macos_window_background_blur = 30

-- Window border settings
config.window_frame = {
	-- Title bar colors
	active_titlebar_bg = "#1D1F21",
	inactive_titlebar_bg = "#282A2E",

	-- Border widths (Fixed)
	border_left_width = 2,
	border_right_width = 3,
	border_top_height = 2, -- Fixed: Was incorrectly named as border_top_width
	border_bottom_height = 2, -- Fixed: Was incorrectly named as border_bottom_width

	-- Border colors
	border_left_color = "#44475A",
	border_right_color = "#44475A",
	border_top_color = "#44475A",
	border_bottom_color = "#44475A",
}

-- Window padding
config.line_height = 1.3
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

-- Return the finalized configuration
return config

