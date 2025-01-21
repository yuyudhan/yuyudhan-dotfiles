-- FilePath: lua/plugins/formatters.lua

return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                sql = { "pg_format" },
            },
        },
    },
}

