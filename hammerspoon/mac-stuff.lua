-- ~/.config/hammerspoon/mac-stuff.lua

-- Module for macOS-specific functionality
local macStuff = {}

-- Logger setup
local log = hs.logger.new('mac-stuff', 'info')

-- Function to toggle the visibility of the macOS menu bar
function macStuff.toggleMenuBar()
    log.i("Toggling menu bar visibility...")

    -- Execute the `defaults read` command to get the current menu bar state
    local hideMenuBarStatus, success = hs.execute("defaults read NSGlobalDomain _HIHideMenuBar 2>/dev/null", true)

    if not success then
        hs.alert.show("Failed to read menu bar state")
        log.e("Error executing defaults read command")
        return
    end

    -- Parse the status output
    hideMenuBarStatus = hideMenuBarStatus:match("%d") -- Extract numerical state

    if hideMenuBarStatus == "1" then
        -- Menu bar is hidden, make it visible
        local success = hs.execute("defaults write NSGlobalDomain _HIHideMenuBar -bool false && killall Dock", true)
        if success then
            hs.alert.show("Menu bar is now visible")
            log.i("Menu bar visibility set to ON")
        else
            hs.alert.show("Failed to show the menu bar")
            log.e("Failed to execute command to show the menu bar")
        end
    elseif hideMenuBarStatus == "0" then
        -- Menu bar is visible, hide it
        local success = hs.execute("defaults write NSGlobalDomain _HIHideMenuBar -bool true && killall Dock", true)
        if success then
            hs.alert.show("Menu bar is now hidden")
            log.i("Menu bar visibility set to OFF")
        else
            hs.alert.show("Failed to hide the menu bar")
            log.e("Failed to execute command to hide the menu bar")
        end
    else
        -- Handle unexpected output
        hs.alert.show("Unable to determine menu bar state")
        log.e("Unexpected output from defaults command: " .. hideMenuBarStatus)
    end
end

-- Bind hotkey to toggle menu bar visibility
hs.hotkey.bind({"ctrl", "cmd", "shift"}, "B", function()
    macStuff.toggleMenuBar()
end)

return macStuff

