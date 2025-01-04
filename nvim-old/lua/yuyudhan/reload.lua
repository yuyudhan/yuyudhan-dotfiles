-- nvim/nvim/lua/yuyudhan/reload.lua

local M = {}

M.reload_config = function()
    for name, _ in pairs(package.loaded) do
        if name:match("^yuyudhan") or name:match("^plugins") then
            package.loaded[name] = nil
        end
    end
    dofile(vim.fn.stdpath("config") .. "/init.lua")
    print("Configuration reloaded!")
end

return M

