-- ~/.config/hammerspoon/pane_management.lua

-- Module to manage window placement in quadrants and halves of the screen
-- Provides shortcuts for arranging windows: Option + Shift + H/J/K/L, Option + Shift + Q/W/E/R, Option + Shift + M

-- Logger setup
local log = hs.logger.new('pane_management', 'info')

local pane_management = {}

-- Function to move and resize the focused window
local function setWindowPosition(position)
    local win = hs.window.focusedWindow()
    if not win then
        log.e("No focused window to move")
        hs.alert.show("No focused window")
        return
    end

    local screen = win:screen()
    local frame = screen:frame()

    local targetFrame = hs.geometry.new(frame)

    if position == "left" then
        targetFrame.w = frame.w / 2
    elseif position == "right" then
        targetFrame.x = frame.x + frame.w / 2
        targetFrame.w = frame.w / 2
    elseif position == "top" then
        targetFrame.h = frame.h / 2
    elseif position == "bottom" then
        targetFrame.y = frame.y + frame.h / 2
        targetFrame.h = frame.h / 2
    elseif position == "top_left" then
        targetFrame.w = frame.w / 2
        targetFrame.h = frame.h / 2
    elseif position == "bottom_left" then
        targetFrame.w = frame.w / 2
        targetFrame.y = frame.y + frame.h / 2
        targetFrame.h = frame.h / 2
    elseif position == "bottom_right" then
        targetFrame.x = frame.x + frame.w / 2
        targetFrame.y = frame.y + frame.h / 2
        targetFrame.w = frame.w / 2
        targetFrame.h = frame.h / 2
    elseif position == "top_right" then
        targetFrame.x = frame.x + frame.w / 2
        targetFrame.w = frame.w / 2
        targetFrame.h = frame.h / 2
    elseif position == "maximize" then
        targetFrame = frame -- Set to full screen of the current monitor
    else
        log.e("Invalid position: " .. tostring(position))
        hs.alert.show("Invalid position: " .. tostring(position))
        return
    end

    win:setFrame(targetFrame)
    log.i("Moved window to " .. position)
    hs.alert.show("Moved window to " .. position)
end

-- Function to toggle maximize
local isMaximized = false
local previousFrame = nil

local function toggleMaximize()
    local win = hs.window.focusedWindow()
    if not win then
        log.e("No focused window to maximize")
        hs.alert.show("No focused window")
        return
    end

    if not isMaximized then
        previousFrame = win:frame()
        setWindowPosition("maximize")
        isMaximized = true
    else
        if previousFrame then
            win:setFrame(previousFrame)
            log.i("Restored window to previous size")
            hs.alert.show("Restored window size")
        else
            log.e("No previous window frame to restore")
            hs.alert.show("No previous window frame to restore")
        end
        isMaximized = false
    end
end

-- Bind hotkeys for window management
hs.hotkey.bind({"alt", "shift"}, "H", function() setWindowPosition("left") end)
hs.hotkey.bind({"alt", "shift"}, "L", function() setWindowPosition("right") end)
hs.hotkey.bind({"alt", "shift"}, "J", function() setWindowPosition("bottom") end)
hs.hotkey.bind({"alt", "shift"}, "K", function() setWindowPosition("top") end)

hs.hotkey.bind({"alt", "shift"}, "Q", function() setWindowPosition("top_left") end)
hs.hotkey.bind({"alt", "shift"}, "W", function() setWindowPosition("bottom_left") end)
hs.hotkey.bind({"alt", "shift"}, "E", function() setWindowPosition("bottom_right") end)
hs.hotkey.bind({"alt", "shift"}, "R", function() setWindowPosition("top_right") end)

-- Bind hotkey for maximizing/restoring window
hs.hotkey.bind({"alt", "shift"}, "M", toggleMaximize)

return pane_management

