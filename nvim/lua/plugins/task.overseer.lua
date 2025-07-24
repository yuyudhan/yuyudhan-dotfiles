-- FilePath: nvim/lua/plugins/task.overseer.lua

return {
    "stevearc/overseer.nvim",
    opts = {
        templates = { "builtin" },
        strategy = {
            "terminal",
            use_shell = true,
        },
        task_list = {
            direction = "bottom",
            min_height = 10,
            max_height = 20,
            default_detail = 1,
        },
    },
    keys = {
        { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Task" },
        { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },
        { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
        { "<leader>oi", "<cmd>OverseerInfo<cr>", desc = "Task Info" },
    },
}