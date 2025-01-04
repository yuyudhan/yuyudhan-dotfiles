-- ~/.config/hammerspoon/hammerspoon.lua

-- Module to manage Hammerspoon configurations and logs with shortcuts
-- Provides shortcuts for reloading config, opening configuration, and viewing logs

-- Logger setup
local log = hs.logger.new('hammerspoon', 'info')

local hammerspoon = {}

-- Function to reload Hammerspoon configuration
local function reloadConfig()
    log.i("Reloading Hammerspoon configuration...")
    hs.reload()
    hs.alert.show("Hammerspoon configuration reloaded")
end

-- Function to open Hammerspoon configuration directory
local function openConfig()
    log.i("Opening Hammerspoon configuration directory...")
    local configPath = os.getenv("HOME") .. "/.config/hammerspoon/"
    hs.execute("open " .. configPath)
    hs.alert.show("Opened Hammerspoon configuration")
end

-- Function to open Hammerspoon logs
local function openLogs()
    log.i("Opening Hammerspoon logs...")
    local logPath = os.getenv("HOME") .. "/Library/Application Support/Hammerspoon/console.log"
    hs.execute("open " .. logPath)
    hs.alert.show("Opened Hammerspoon logs")
end

-- Bind hotkeys for Hammerspoon management
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "R", reloadConfig)
hs.hotkey.bind({"cmd", "ctrl", "shift"}, ",", openConfig)
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "P", openConfig)
hs.hotkey.bind({"cmd", "ctrl", "shift"}, "L", openLogs)

return hammerspoon

