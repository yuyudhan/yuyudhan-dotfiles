-- FilePath: wezterm/wezterm.lua

local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- ================================
-- Appearance Settings
-- ================================
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 15

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Catppuccin Mocha window frame
config.window_frame = {
    active_titlebar_bg = "#1e1e2e",
    inactive_titlebar_bg = "#181825",
    border_left_width = 0,
    border_right_width = 0,
    border_top_height = 0,
    border_bottom_height = 0,
}

config.line_height = 1.3
config.window_padding = {
    left = 15,
    right = 15,
    top = 10,
    bottom = 10,
}

-- ================================
-- Performance Settings
-- ================================
config.max_fps = 60
config.animation_fps = 30
config.cursor_blink_rate = 1000
config.default_cursor_style = "SteadyBlock"
config.cursor_thickness = 2

config.force_reverse_video_cursor = false
-- WebGpu for best performance, falls back to OpenGL if unavailable
config.front_end = "WebGpu"

config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.audible_bell = "Disabled"
config.visual_bell = {
    fade_in_duration_ms = 0,
    fade_out_duration_ms = 0,
}

-- ================================
-- Tab Bar Settings
-- ================================

config.enable_tab_bar = false
config.use_fancy_tab_bar = false

-- Catppuccin Mocha colors
config.colors = {
    foreground = "#cdd6f4",
    background = "#1e1e2e",
    cursor_bg = "#f5e0dc",
    cursor_fg = "#1e1e2e",
    cursor_border = "#f5e0dc",
    selection_fg = "#1e1e2e",
    selection_bg = "#f5e0dc",
    scrollbar_thumb = "#585b70",
    split = "#6c7086",

    ansi = {
        "#45475a", -- black
        "#f38ba8", -- red
        "#a6e3a1", -- green
        "#f9e2af", -- yellow
        "#89b4fa", -- blue
        "#f5c2e7", -- magenta
        "#94e2d5", -- cyan
        "#bac2de", -- white
    },

    brights = {
        "#585b70", -- bright black
        "#f38ba8", -- bright red
        "#a6e3a1", -- bright green
        "#f9e2af", -- bright yellow
        "#89b4fa", -- bright blue
        "#f5c2e7", -- bright magenta
        "#94e2d5", -- bright cyan
        "#a6adc8", -- bright white
    },

    tab_bar = {
        background = "#11111b",
        active_tab = {
            bg_color = "#cba6f7",
            fg_color = "#11111b",
            intensity = "Bold",
        },
        inactive_tab = {
            bg_color = "#181825",
            fg_color = "#cdd6f4",
        },
        inactive_tab_hover = {
            bg_color = "#313244",
            fg_color = "#cdd6f4",
        },
        new_tab = {
            bg_color = "#181825",
            fg_color = "#cdd6f4",
        },
        new_tab_hover = {
            bg_color = "#313244",
            fg_color = "#cdd6f4",
        },
    },
}

-- ================================
-- Quick Select Configuration
-- ================================

config.quick_select_patterns = {
    -- URLs (http/https)
    "https?://\\S+",
    -- File paths (absolute and relative)
    "[./~][\\w\\-@:./]+",
    -- Git hashes
    "[0-9a-f]{7,40}",
    -- IP addresses
    "\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b",
    -- UUIDs
    "[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}",
    -- Hex colors
    "#[0-9a-fA-F]{6}",
}

-- ================================
-- Mouse and Hyperlink Configuration
-- ================================

-- Clickable URLs
config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Add custom rules for common patterns
table.insert(config.hyperlink_rules, {
    regex = "\\b\\w+://[\\w.-]+\\S*\\b",
    format = "$0",
})

-- GitHub issue/PR references (e.g., #123)
table.insert(config.hyperlink_rules, {
    regex = "#(\\d+)",
    format = "https://github.com/$1",
})

-- Mouse bindings
config.mouse_bindings = {
    -- CMD+Click to open URLs
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CMD",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
    -- Right-click paste
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action.PasteFrom("Clipboard"),
    },
    -- CTRL+Click to select block
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.SelectTextAtMouseCursor("SemanticZone"),
    },
}

-- ================================
-- Key Bindings
-- ================================

config.keys = {
    -- SHIFT+Enter sends escape sequence (for shell integrations)
    { key = "Enter", mods = "SHIFT", action = wezterm.action.SendString("\x1b\r") },

    -- Tab management
    { key = "t",     mods = "CMD",   action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w",     mods = "CMD",   action = wezterm.action.CloseCurrentTab({ confirm = true }) },
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
    { key = "1", mods = "CMD",        action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "CMD",        action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "CMD",        action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "CMD",        action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "CMD",        action = wezterm.action.ActivateTab(4) },
    { key = "6", mods = "CMD",        action = wezterm.action.ActivateTab(5) },
    { key = "7", mods = "CMD",        action = wezterm.action.ActivateTab(6) },
    { key = "8", mods = "CMD",        action = wezterm.action.ActivateTab(7) },
    { key = "9", mods = "CMD",        action = wezterm.action.ActivateTab(8) },
    { key = "[", mods = "CMD",        action = wezterm.action.ActivateTabRelative(-1) },
    { key = "]", mods = "CMD",        action = wezterm.action.ActivateTabRelative(1) },

    -- Search mode
    { key = "f", mods = "CMD",        action = wezterm.action.Search("CurrentSelectionOrEmptyString") },

    -- Font size adjustment
    { key = "=", mods = "CMD",        action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "CMD",        action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "CMD",        action = wezterm.action.ResetFontSize },

    -- Quick select mode (for URLs, paths, hashes)
    { key = " ", mods = "CTRL|SHIFT", action = wezterm.action.QuickSelect },

    -- Fullscreen toggle
    { key = "f", mods = "CMD|CTRL",   action = wezterm.action.ToggleFullScreen },
}

return config
