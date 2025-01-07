-- ~/.config/hammerspoon/init.lua

-- Entry point for Hammerspoon configuration
-- Includes mac-stuff.lua and hammerspoon.lua for additional functionalities

-- Logger setup
local log = hs.logger.new('init', 'info')
log.i("Loading Hammerspoon configuration")

-- Helper function to load modules with error handling
local function safeRequire(moduleName)
    local success, module = pcall(require, moduleName)
    if success then
        log.i("Successfully loaded " .. moduleName)
        return module
    else
        log.e("Error loading " .. moduleName .. ": " .. module)
        return nil
    end
end

-- Require mac-stuff module
local macStuff = safeRequire("mac-stuff")

-- Require hammerspoon module
local hammerspoon = safeRequire("hammerspoon")

-- Reload configuration on file change
hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", hs.reload):start()
log.i("Path watcher set up to auto-reload config")
hs.alert.show("Hammerspoon config loaded")


