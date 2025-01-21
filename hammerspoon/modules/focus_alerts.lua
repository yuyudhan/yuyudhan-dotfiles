-- FilePath: hammerspoon/focus_alerts.lua

-- Show alert when application focus changes, including app name and monitor details

local log = hs.logger.new("focus_alerts", "info")

local focusAlerts = {}

-- Function to show focus alerts
local function showFocusAlert(window)
	if not window then
		log.w("No window detected for focus change")
		return
	end

	local app = window:application()
	local appName = app and app:name() or "Unknown Application"
	local screen = window:screen()
	local monitorName = screen and screen:name() or "Unknown Monitor"

	local alertMessage = "Focused on " .. appName .. "\nMonitor: " .. monitorName
	hs.alert.show(alertMessage)
	log.i(alertMessage)
end

-- Custom window filter for visible apps only
local customWindowFilter = hs.window.filter.new():setFilters({
	default = { visible = true }, -- Include only visible windows
})

-- Subscribe to focus changes
customWindowFilter:subscribe(hs.window.filter.windowFocused, showFocusAlert)

log.i("Focus alerts module loaded")
return focusAlerts

