-- FilePath: ~/.config/hammerspoon/aerospace_alerts.lua

-- AeroSpace Alerts Integration
local log = hs.logger.new("aerospace_alerts", "info")
local aerospace = {}

-- Function to alert workspace changes
local function workspaceAlert(workspace)
	hs.alert.show("Switched to Workspace: " .. workspace)
	log.i("Switched to Workspace: " .. workspace)
end

-- Function to alert node movements
local function nodeMoveAlert(workspace)
	hs.alert.show("Node moved to Workspace: " .. workspace)
	log.i("Node moved to Workspace: " .. workspace)
end

-- Function to alert layout changes
local function layoutAlert(layout)
	hs.alert.show("Layout changed to: " .. layout)
	log.i("Layout changed to: " .. layout)
end

-- Bind hotkeys for AeroSpace actions
hs.hotkey.bind({ "ctrl", "alt", "shift" }, "W", function()
	workspaceAlert("Example Workspace") -- Replace with dynamic workspace handling
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "N", function()
	nodeMoveAlert("Example Node Workspace") -- Replace with dynamic workspace handling
end)

hs.hotkey.bind({ "ctrl", "alt", "shift" }, "L", function()
	layoutAlert("Tiles Horizontal") -- Replace with dynamic layout handling
end)

-- Integration with AeroSpace commands via shell scripts (example only)
-- Modify as needed based on how AeroSpace is set up to log/emit commands

log.i("AeroSpace alerts module loaded")
return aerospace

