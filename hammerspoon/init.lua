-- ~/.config/hammerspoon/init.lua
-- Entry point for Hammerspoon configuration
-- Requires monitor_movement.lua, space_movement.lua, pane_management.lua, and hammerspoon.lua for managing various functionalities

-- Logger setup
local log = hs.logger.new('init', 'info')
log.i("Loading Hammerspoon configuration")

-- -- Require monitor_movement module
-- local success_monitor, err_monitor = pcall(require, "monitor_movement")
-- if not success_monitor then
--     log.e("Error loading monitor_movement.lua: " .. err_monitor)
-- end
-- 
-- -- Require space_movement module
-- local success_space, err_space = pcall(require, "space_movement")
-- if not success_space then
--     log.e("Error loading space_movement.lua: " .. err_space)
-- end
-- 
-- -- Require pane_management module
-- local success_pane, err_pane = pcall(require, "pane_management")
-- if not success_pane then
--     log.e("Error loading pane_management.lua: " .. err_pane)
-- end

-- Require hammerspoon module
local success_hs, err_hs = pcall(require, "hammerspoon")
if not success_hs then
    log.e("Error loading hammerspoon.lua: " .. err_hs)
end

-- Reload configuration on file change
hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", hs.reload):start()
log.i("Path watcher set up to auto-reload config")
hs.alert.show("Hammerspoon config loaded")

