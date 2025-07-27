-- FilePath: wezterm/wezterm.lua

local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- ================================
-- Appearance Settings
-- ================================
config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 15

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.92
config.macos_window_background_blur = 15

-- Hacker-style dark gradient
config.window_background_gradient = {
	orientation = "Vertical",
	colors = {
		"#0c0c0c",
		"#1a1a1a",
		"#0f0f0f",
	},
	interpolation = "Linear",
	blend = "Rgb",
}

-- Minimal dark frame
config.window_frame = {
	active_titlebar_bg = "#1a1a1a",
	inactive_titlebar_bg = "#0c0c0c",
	border_left_width = 0,
	border_right_width = 0,
	border_top_height = 0,
	border_bottom_height = 0,
}

config.line_height = 1.4
config.window_padding = {
	left = 15,
	right = 15,
	top = 10,
	bottom = 10,
}

-- ================================
-- Performance Settings
-- ================================
config.max_fps = 120
config.animation_fps = 30
config.cursor_blink_rate = 800
config.default_cursor_style = "BlinkingBlock"
config.cursor_thickness = 2

-- Smooth cursor transitions
config.force_reverse_video_cursor = true

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

-- Hacker-style minimalist tab styling
config.colors = {
	tab_bar = {
		background = "#0c0c0c",
		active_tab = {
			bg_color = "#1a1a1a",
			fg_color = "#00ff00",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#0c0c0c",
			fg_color = "#888888",
		},
		inactive_tab_hover = {
			bg_color = "#1a1a1a",
			fg_color = "#cccccc",
		},
		new_tab = {
			bg_color = "#0c0c0c",
			fg_color = "#666666",
		},
		new_tab_hover = {
			bg_color = "#1a1a1a",
			fg_color = "#00ff00",
		},
	},
	-- Hacker terminal colors
	foreground = "#00ff00",
	background = "#0c0c0c",
	cursor_bg = "#00ff00",
	cursor_fg = "#0c0c0c",
	cursor_border = "#00ff00",
	selection_fg = "#0c0c0c",
	selection_bg = "#00ff00",
	scrollbar_thumb = "#333333",
	split = "#00ff00",
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

