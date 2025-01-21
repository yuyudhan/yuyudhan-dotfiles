-- FilePath: ~/.hammerspoon/modules/system_resources.lua

-- System Resource Monitor

local log = hs.logger.new("system_resources", "info")

-- Thresholds
local CPU_THRESHOLD = 50 -- Alert if CPU usage exceeds 50%
local RAM_THRESHOLD = 80 -- Alert if RAM usage exceeds 80% (as a percentage of total)

-- Function to safely get system resource details
local function getSystemDetails()
	local cpuUsage = 0
	local ramUsagePercent = 0
	local totalRam = 16 -- Default to 16GB
	local usedRam = 0

	-- Safely get CPU usage
	local cpuData = hs.host.cpuUsage()
	if cpuData and cpuData.overall and cpuData.overall.active then
		cpuUsage = cpuData.overall.active
	else
		log.e("Failed to retrieve CPU usage")
	end

	-- Safely calculate RAM usage
	local memStats = hs.host.vmStat()
	if memStats then
		local pageSize = 4096 / (1024 ^ 3) -- Convert pages to GB
		usedRam = (memStats.active + memStats.wired) * pageSize
		ramUsagePercent = (usedRam / totalRam) * 100
	else
		log.e("Failed to retrieve RAM statistics")
	end

	return {
		cpuUsage = cpuUsage,
		ramUsage = ramUsagePercent,
		totalRam = totalRam,
		usedRam = usedRam,
	}
end

-- Function to check thresholds and alert
local function monitorResources()
	local details = getSystemDetails()

	if details.cpuUsage > CPU_THRESHOLD then
		hs.alert.show(string.format("High CPU Usage: %.2f%%", details.cpuUsage))
		log.w(string.format("CPU usage exceeded threshold: %.2f%%", details.cpuUsage))
	end

	if details.ramUsage > RAM_THRESHOLD then
		hs.alert.show(string.format("High RAM Usage: %.2f%%", details.ramUsage))
		log.w(string.format("RAM usage exceeded threshold: %.2f%%", details.ramUsage))
	end
end

-- Function to display system details with a hotkey
local function showSystemDetails()
	local details = getSystemDetails()
	local message = string.format(
		"System Resources:\nCPU Usage: %.2f%%\nRAM Usage: %.2f%%\nTotal RAM: %.2f GB\nUsed RAM: %.2f GB",
		details.cpuUsage,
		details.ramUsage,
		details.totalRam,
		details.usedRam
	)
	hs.alert.show(message)
	log.i("Displayed system details: " .. message)
end

-- Hotkey to display system details
hs.hotkey.bind({ "cmd", "ctrl", "shift" }, "C", showSystemDetails)

-- Monitor resources every 30 seconds
hs.timer.doEvery(30, monitorResources)

log.i("System resources monitor module loaded")

