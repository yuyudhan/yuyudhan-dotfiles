-- ~/.config/hammerspoon/monitor_movement.lua
-- Module to move focus between monitors in all directions (up, right, left, down)
-- with Vim-style bindings (Ctrl + Alt + H, J, K, L)

-- Logger setup
local log = hs.logger.new('monitor', 'info')

local monitor = {}

-- Function to get the target screen in a specific direction based on relative positioning
local function getRelativeMonitor(currentScreen, direction)
    local screens = hs.screen.allScreens()
    local currentFrame = currentScreen:frame()
    local targetScreen = nil
    local minDistance = math.huge

    for _, screen in ipairs(screens) do
        if screen ~= currentScreen then
            local frame = screen:frame()
            local distance = nil

            if direction == "left" and frame.x + frame.w <= currentFrame.x then
                distance = currentFrame.x - (frame.x + frame.w)
            elseif direction == "right" and frame.x >= currentFrame.x + currentFrame.w then
                distance = frame.x - (currentFrame.x + currentFrame.w)
            elseif direction == "up" and frame.y + frame.h <= currentFrame.y then
                distance = currentFrame.y - (frame.y + frame.h)
            elseif direction == "down" and frame.y >= currentFrame.y + currentFrame.h then
                distance = frame.y - (currentFrame.y + currentFrame.h)
            end

            if distance and distance < minDistance then
                minDistance = distance
                targetScreen = screen
            end
        end
    end

    return targetScreen
end

-- Function to move focus to the monitor in a specific direction
local function focusMonitor(direction)
    local currentScreen = hs.screen.mainScreen()
    local targetScreen = getRelativeMonitor(currentScreen, direction)

    if targetScreen then
        -- Focus on the target screen even if no windows are present
        local frame = targetScreen:fullFrame()
        local mousePosition = {x = frame.x + frame.w / 2, y = frame.y + frame.h / 2}
        hs.mouse.setAbsolutePosition(mousePosition)
        hs.alert.show("Focused on " .. direction .. " monitor: " .. targetScreen:name())
        log.i("Focused on " .. direction .. " monitor: " .. targetScreen:name())
    else
        log.w("No " .. direction .. " monitor found")
        hs.alert.show("No " .. direction .. " monitor found")
    end
end

-- Bind hotkeys for Vim-style directional focus
hs.hotkey.bind({"ctrl", "alt"}, "H", function() focusMonitor("left") end)
hs.hotkey.bind({"ctrl", "alt"}, "L", function() focusMonitor("right") end)
hs.hotkey.bind({"ctrl", "alt"}, "K", function() focusMonitor("up") end)
hs.hotkey.bind({"ctrl", "alt"}, "J", function() focusMonitor("down") end)

return monitor

-- ~/.config/hammerspoon/monitor_movement.lua
-- Module to move focus between monitors in all directions (up, right, left, down)
-- with Vim-style bindings (Ctrl + Alt + H, J, K, L)

-- Logger setup
local log = hs.logger.new('monitor', 'info')

local monitor = {}

-- Function to move focus to the monitor in a specific direction
local function focusMonitor(direction)
    log.i("Focusing on the " .. direction .. " monitor...")
    local screen = hs.screen.mainScreen()
    local targetScreen

    if direction == "up" then
        targetScreen = screen:toNorth()
    elseif direction == "down" then
        targetScreen = screen:toSouth()
    elseif direction == "left" then
        targetScreen = screen:toWest()
    elseif direction == "right" then
        targetScreen = screen:toEast()
    end

    if targetScreen then
        local windows = hs.window.orderedWindows()
        for _, win in ipairs(windows) do
            if win:screen() == targetScreen then
                win:focus()
                log.i("Focused on a window in the " .. direction .. " monitor: " .. targetScreen:name())
                hs.alert.show("Focused on " .. direction .. " monitor: " .. targetScreen:name())
                return
            end
        end

        log.w("No windows found in the " .. direction .. " monitor")
        hs.alert.show("No windows found in " .. direction .. " monitor")
    else
        log.w("No " .. direction .. " monitor found")
        hs.alert.show("No " .. direction .. " monitor found")
    end
end

-- Bind hotkeys for Vim-style directional focus
hs.hotkey.bind({"ctrl", "alt"}, "H", function() focusMonitor("left") end)
hs.hotkey.bind({"ctrl", "alt"}, "L", function() focusMonitor("right") end)
hs.hotkey.bind({"ctrl", "alt"}, "K", function() focusMonitor("up") end)
hs.hotkey.bind({"ctrl", "alt"}, "J", function() focusMonitor("down") end)

return monitor

