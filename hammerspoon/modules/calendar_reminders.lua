-- FilePath: ~/.hammerspoon/modules/calendar_reminders.lua

-- Calendar Reminders

local log = hs.logger.new("calendar_reminders", "info")

-- Configuration
local CHECK_INTERVAL = 60 -- Check every 60 seconds
local TEN_MIN_BEFORE = 10 * 60 -- 10 minutes in seconds
local TWO_MIN_BEFORE = 2 * 60 -- 2 minutes in seconds

-- Function to get events from macOS Calendar
local function getCalendarEvents()
	local events = hs.osascript.applescript([[
        tell application "Calendar"
            set eventList to {}
            set now to current date
            set endTime to now + (2 * hours) -- Look for events in the next 2 hours
            repeat with cal in calendars
                set eventList to eventList & (events of cal whose start date ≥ now and start date ≤ endTime)
            end repeat
            return eventList
        end tell
    ]])
	if events then
		return events[1] or {}
	else
		log.e("Failed to fetch events from Calendar")
		return {}
	end
end

-- Function to send reminders for events
local function sendReminders()
	local events = getCalendarEvents()
	local now = os.time()

	for _, event in ipairs(events) do
		local eventTitle = event.summary or "Untitled Event"
		local eventStartTime = event.startDate

		if eventStartTime then
			local secondsToStart = os.difftime(eventStartTime, now)

			if secondsToStart <= TEN_MIN_BEFORE and secondsToStart > TEN_MIN_BEFORE - CHECK_INTERVAL then
				hs.alert.show("Upcoming Event (10 min): " .. eventTitle)
				log.i("Reminder (10 min before): " .. eventTitle)
			elseif secondsToStart <= TWO_MIN_BEFORE and secondsToStart > TWO_MIN_BEFORE - CHECK_INTERVAL then
				hs.alert.show("Upcoming Event (2 min): " .. eventTitle)
				log.i("Reminder (2 min before): " .. eventTitle)
			end
		end
	end
end

-- Set up a timer to check for events periodically
hs.timer.doEvery(CHECK_INTERVAL, sendReminders)

log.i("Calendar reminders module loaded")

