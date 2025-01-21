--  FilePath: hammerspoon/wifi_automation.lua

-- Notify the current Wi-Fi network name on connection

local log = hs.logger.new("wifi", "info")

local function onWifiChange()
	local currentNetwork = hs.wifi.currentNetwork()
	if currentNetwork then
		local alertMessage = "Connected to Wi-Fi: " .. currentNetwork
		hs.alert.show(alertMessage)
		log.i(alertMessage)
	else
		hs.alert.show("Not connected to any Wi-Fi")
		log.w("No Wi-Fi network connected")
	end
end

hs.wifi.watcher.new(onWifiChange):start()
onWifiChange()

log.i("Wi-Fi automation module loaded")

