-- FilePath: nvim/lua/plugins/quickfix.nvim-bqf.lua

return {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    dependencies = {
        "junegunn/fzf",
        build = function()
            vim.fn["fzf#install"]()
        end,
    },
    opts = {
        auto_enable = true,
        auto_resize_height = true,
        preview = {
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
            show_title = false,
            should_preview_cb = function(bufnr, qwinid)
                local ret = true
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                local fsize = vim.fn.getfsize(bufname)
                if fsize > 100 * 1024 then
                    -- skip file size greater than 100k
                    ret = false
                elseif bufname:match("^fugitive://") then
                    -- skip fugitive buffer
                    ret = false
                end
                return ret
            end,
        },
        func_map = {
            drop = "o",
            openc = "O",
            split = "<C-s>",
            tabdrop = "<C-t>",
            tabc = "",
            ptogglemode = "z,",
            ptoggleitem = "p",
            ptoggleauto = "P",
            pscrollup = "<C-b>",
            pscrolldown = "<C-f>",
            prevfile = "<C-p>",
            nextfile = "<C-n>",
            prevhist = "<",
            nexthist = ">",
            stoggleup = "<S-Tab>",
            stoggledown = "<Tab>",
            stogglevm = "<Tab>",
            stogglebuf = "'<Tab>",
            sclear = "z<Tab>",
            filter = "zn",
            filterr = "zN",
            fzffilter = "zf",
        },
        filter = {
            fzf = {
                action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
                extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
            },
        },
    },
}