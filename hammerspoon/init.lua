-- ~/.config/hammerspoon/init.lua

local log = hs.logger.new("init", "info")
log.i("Loading Hammerspoon configuration")

-- Helper function to safely require modules
local function safeRequire(moduleName)
	local success, module = pcall(require, "modules." .. moduleName)
	if success then
		log.i("Loaded module: " .. moduleName)
		return module
	else
		log.e("Failed to load module: " .. moduleName .. " - " .. module)
		return nil
	end
end

-- Load custom modules
safeRequire("battery_alerts")
-- safeRequire("focus_alerts")
safeRequire("wifi_automation")
safeRequire("mac_stuff")
safeRequire("hammerspoon") -- Core utilities
safeRequire("water_reminder") -- Core utilities
safeRequire("system_resources") -- Core utilities
safeRequire("aerospace_alerts") -- Core utilities

-- Auto-reload on config change
hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", hs.reload):start()
hs.alert.show("Hammerspoon configuration loaded")

