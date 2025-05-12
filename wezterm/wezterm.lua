-- FilePath: wezterm/wezterm.lua

local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ================================
-- Appearance Settings
-- ================================
config.color_scheme = "Gruvbox Dark"
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" })

wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
-- config.font = wezterm.font("UbuntuMono Nerd Font")
config.font_size = 16

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.7
config.macos_window_background_blur = 10

config.window_frame = {
	active_titlebar_bg = "#2E3440",
	inactive_titlebar_bg = "#3B4252",
	border_left_width = 2,
	border_right_width = 3,
	border_top_height = 2,
	border_bottom_height = 2,
	border_left_color = "#4C566A",
	border_right_color = "#4C566A",
	border_top_color = "#4C566A",
	border_bottom_color = "#4C566A",
}

config.line_height = 1.3
config.window_padding = {
	left = 10,
	right = 10,
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
	{ key = "h", mods = "CTRL", action = wezterm.action.SendKey({ key = "h", mods = "CTRL" }) },
	{ key = "j", mods = "CTRL", action = wezterm.action.SendKey({ key = "j", mods = "CTRL" }) },
	{ key = "k", mods = "CTRL", action = wezterm.action.SendKey({ key = "k", mods = "CTRL" }) },
	{ key = "l", mods = "CTRL", action = wezterm.action.SendKey({ key = "l", mods = "CTRL" }) },
}

return config

