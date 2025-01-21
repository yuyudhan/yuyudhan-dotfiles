-- FilePath: lua/plugins/chatgpt.lua

return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("chatgpt").setup({
            api_key_cmd = "echo $OPENAI_API_KEY",
            openai_params = {
                model = "gpt-4o", -- Set GPT-4o as the default model
                temperature = 0.7,
                max_tokens = 4096,
            },
            yank_register = "+",
            edit_with_instructions = {
                diff = true,
                model = "gpt-4o", -- Set GPT-4o as the default model
                keymaps = {
                    use_output_as_input = "<C-y>",
                },
            },
            chat = {
                welcome_message = "🚀 ChatGPT (GPT-4o) is ready!",
                loading_text = "Loading...",
                model = "gpt-4o", -- Set GPT-4o as the default model
                question_sign = "🤔",
                answer_sign = "🤖",
            },
        })

        -- 🔑 Custom Keybindings for ChatGPT.nvim (SPC c)
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true, desc = "ChatGPT" }

        -- Open ChatGPT prompt
        map("n", "<leader>cc", ":ChatGPT<CR>", { desc = "Chat with GPT-4o", unpack(opts) })

        -- Edit selected text with ChatGPT
        map("v", "<leader>ce", ":ChatGPTEditWithInstructions<CR>", { desc = "Edit with GPT-4o", unpack(opts) })

        -- Use ChatGPT in "Act As" mode (role-based prompts)
        map("n", "<leader>ca", ":ChatGPTActAs<CR>", { desc = "Act as... (GPT-4o)", unpack(opts) })

        -- Open ChatGPT code completion in floating window
        map("n", "<leader>ct", ":ChatGPTCompleteCode<CR>", { desc = "Complete Code with GPT-4o", unpack(opts) })
    end,
}

