-- FilePath: nvim/lua/plugins/editing.better-escape.lua

return {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
        require("better_escape").setup({
            mappings = {
                i = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
                c = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
                t = {
                    j = {
                        k = "<Esc>",
                        j = "<Esc>",
                    },
                },
                v = {
                    j = {
                        k = "<Esc>",
                    },
                },
                s = {
                    j = {
                        k = "<Esc>",
                    },
                },
            },
            timeout = vim.o.timeoutlen,
            clear_empty_lines = false,
        })
    end,
}