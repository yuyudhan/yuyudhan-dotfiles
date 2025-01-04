-- ~/.config/hammerspoon/space_movement.lua
-- Module to move focus to macOS Spaces (workspaces) on the current monitor
-- Uses shortcuts: Ctrl + Option + H/L for left/right, Ctrl + Option + [1-8] for specific spaces.

-- Logger setup
local log = hs.logger.new('space_movement', 'info')

local space_movement = {}

-- Configuration
local maxSpacesPerMonitor = 8 -- Maximum number of spaces per monitor

-- Function to get the focused screen (monitor)
local function getFocusedScreen()
    local focusedWindow = hs.window.focusedWindow()
    if focusedWindow then
        return focusedWindow:screen()
    else
        return hs.screen.mainScreen()
    end
end

-- Function to move focus to a specific space on the current monitor
local function moveToSpace(spaceNumber)
    if spaceNumber < 1 or spaceNumber > maxSpacesPerMonitor then
        log.e("Space number out of range: " .. spaceNumber)
        hs.alert.show("Space number must be between 1 and " .. maxSpacesPerMonitor)
        return
    end

    local focusedScreen = getFocusedScreen()
    local monitorName = focusedScreen:name() or "Unknown Monitor"
    local screenUUID = focusedScreen:getUUID()

    -- Get list of spaces for the screen
    local spaces = hs.spaces.spacesForScreen(screenUUID)
    if not spaces or #spaces == 0 then
        log.e("No spaces found for screen UUID: " .. screenUUID)
        hs.alert.show("No workspaces on monitor '" .. monitorName .. "'")
        return
    end

    if spaceNumber > #spaces then
        log.w("No workspace " .. spaceNumber .. " on monitor '" .. monitorName .. "'")
        hs.alert.show("No workspace " .. spaceNumber .. " on monitor '" .. monitorName .. "'")
        return
    end

    local targetSpace = spaces[spaceNumber]
    log.i("Switching to workspace " .. spaceNumber .. " on monitor '" .. monitorName .. "'")
    hs.spaces.gotoSpace(targetSpace)
    hs.alert.show("Switched to workspace " .. spaceNumber .. " on monitor '" .. monitorName .. "'")
end

-- Function to move focus to a workspace in the given direction
local function moveFocus(direction)
    local focusedScreen = getFocusedScreen()
    local monitorName = focusedScreen:name() or "Unknown Monitor"
    local screenUUID = focusedScreen:getUUID()

    -- Get list of spaces for the screen
    local spaces = hs.spaces.spacesForScreen(screenUUID)
    if not spaces or #spaces == 0 then
        log.e("No spaces found for screen UUID: " .. screenUUID)
        hs.alert.show("No workspaces on monitor '" .. monitorName .. "'")
        return
    end

    local currentSpace = hs.spaces.focusedSpace()
    local currentSpaceIndex

    for i, space in ipairs(spaces) do
        if space == currentSpace then
            currentSpaceIndex = i
            break
        end
    end

    if not currentSpaceIndex then
        log.e("Unable to find current space index on monitor '" .. monitorName .. "'")
        hs.alert.show("Unable to determine current workspace on monitor '" .. monitorName .. "'")
        return
    end

    local targetSpaceIndex
    if direction == "left" then
        targetSpaceIndex = currentSpaceIndex - 1
    elseif direction == "right" then
        targetSpaceIndex = currentSpaceIndex + 1
    else
        log.e("Invalid direction: " .. direction)
        hs.alert.show("Invalid direction: " .. direction)
        return
    end

    if targetSpaceIndex < 1 or targetSpaceIndex > #spaces then
        log.w("No workspace in the " .. direction .. " direction on monitor '" .. monitorName .. "'")
        hs.alert.show("No workspace in the " .. direction .. " direction on monitor '" .. monitorName .. "'")
        return
    end

    local targetSpace = spaces[targetSpaceIndex]
    log.i("Switching to the " .. direction .. " space on monitor '" .. monitorName .. "'")
    hs.spaces.gotoSpace(targetSpace)
    hs.alert.show("Switched to workspace " .. targetSpaceIndex .. " on monitor '" .. monitorName .. "'")
end

-- Bind hotkeys for workspace movement
hs.hotkey.bind({"ctrl", "alt"}, "H", function() moveFocus("left") end)
hs.hotkey.bind({"ctrl", "alt"}, "L", function() moveFocus("right") end)

-- Bind hotkeys for specific space navigation (Ctrl + Option + [1-8])
for i = 1, maxSpacesPerMonitor do
    hs.hotkey.bind({"ctrl", "alt"}, tostring(i), function() moveToSpace(i) end)
end

return space_movement

