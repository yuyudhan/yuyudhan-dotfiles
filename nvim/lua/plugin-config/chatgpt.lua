-- nvim/lua/plugin-config/chatgpt.lua


require("chatgpt").setup({
    api_key_cmd = function()
        local api_key = os.getenv("OPENAI_API_KEY")
        if not api_key or api_key == "" then
            error("Environment variable OPENAI_API_KEY is not set or is empty")
        end
        return api_key
    end,
    openai_params = {
        model = "gpt-4o", -- Explicitly use the GPT-4 Omni model
        max_tokens = 3000,
        temperature = 0.7,
    },
    popup_input = {
        border = "rounded",
        win_options = {
            winblend = 10,
        },
    },
    popup_layout = {
        default = "center",
        center = {
            width = "80%",
            height = "80%",
        },
    },
    actions_paths = {}, -- Custom actions (optional)
    keymaps = {
        close = { "<Esc>", "<C-c>" },
        submit = "<C-Enter>",
    }
})

