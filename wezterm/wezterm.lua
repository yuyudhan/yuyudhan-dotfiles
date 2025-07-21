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
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 15

config.window_decorations = "RESIZE"
-- Disabled for performance - transparency/blur are GPU-intensive
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
-- Performance Settings
-- ================================
config.max_fps = 60
config.animation_fps = 10
config.cursor_blink_rate = 500
config.default_cursor_style = "BlinkingBlock"

-- Enable GPU acceleration
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- ================================
-- Tab Bar Settings
-- ================================

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 25

-- Simplified tab styling for better performance
config.colors = {
	tab_bar = {
		background = "#2E3440",
		active_tab = {
			bg_color = "#5E81AC",
			fg_color = "#FFFFFF",
		},
		inactive_tab = {
			bg_color = "#434C5E",
			fg_color = "#ECEFF4",
		},
		inactive_tab_hover = {
			bg_color = "#4C566A",
			fg_color = "#ECEFF4",
		},
	},
}

-- ================================
-- Key Bindings
-- ================================

config.keys = {
	-- Tab management
	{ key = "t", mods = "CMD", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{
		key = "r",
		mods = "CMD",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Tab navigation
	{ key = "1", mods = "CMD", action = wezterm.action.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = wezterm.action.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = wezterm.action.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = wezterm.action.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = wezterm.action.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = wezterm.action.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = wezterm.action.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = wezterm.action.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = wezterm.action.ActivateTab(8) },
	{ key = "[", mods = "CMD", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CMD", action = wezterm.action.ActivateTabRelative(1) },
}

return config

