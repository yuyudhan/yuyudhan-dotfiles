--  FilePath: lua/plugins/comment.lua

return {
    "numToStr/Comment.nvim",
    opts = function(_, opts)
        local ft = require("Comment.ft")
        -- Set '--' as the comment style for SQL files
        ft.set("sql", { "-- %s" })
        return opts
    end,
}

