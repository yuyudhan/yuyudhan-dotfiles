-- FilePath: hammerspoon/battery_alerts.lua

-- Battery Alerts

local log = hs.logger.new("battery", "info")

-- Function to check and alert low battery
local function checkBattery()
	local percentage = hs.battery.percentage()
	if percentage and percentage <= 20 and not hs.battery.isCharging() then
		hs.alert.show("Low Battery: " .. percentage .. "%")
		log.w("Battery is low: " .. percentage .. "%")
	end
end

-- Function to display the current battery percentage
local function showBatteryPercentage()
	local percentage = hs.battery.percentage()
	if percentage then
		hs.alert.show("Battery Percentage: " .. percentage .. "%")
		log.i("Current battery percentage: " .. percentage .. "%")
	else
		hs.alert.show("Unable to determine battery percentage")
		log.e("Failed to retrieve battery percentage")
	end
end

-- Set up timer to check battery every 5 minutes
hs.timer.doEvery(300, checkBattery)
checkBattery()

-- Bind hotkey to display battery percentage
hs.hotkey.bind({ "ctrl", "cmd", "shift" }, "B", showBatteryPercentage)

log.i("Battery alerts module loaded")

