-- FilePath: hammerspoon/modules/water_reminder.lua

-- Water Reminder

local log = hs.logger.new("water_reminder", "info")

local function remindToDrinkWater()
	hs.alert.show("Time to drink water! 💧")
	log.i("Water reminder triggered")
end

-- Function to calculate time until the next 30-minute mark
local function timeUntilNextInterval()
	local now = os.time()
	local minutes = os.date("*t", now).min
	local seconds = os.date("*t", now).sec
	local nextInterval = (30 - (minutes % 30)) * 60 - seconds
	return nextInterval
end

-- Start the timer aligned with 30-minute intervals
local function startWaterReminder()
	local delay = timeUntilNextInterval()
	log.i("Next water reminder in " .. delay .. " seconds")
	hs.timer.doAfter(delay, function()
		remindToDrinkWater()
		hs.timer.doEvery(1800, remindToDrinkWater) -- Every 30 minutes after the first
	end)
end

startWaterReminder()

log.i("Water reminder module loaded")

