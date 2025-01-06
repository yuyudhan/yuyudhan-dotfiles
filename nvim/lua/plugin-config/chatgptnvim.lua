-- lua/plugin-config/chatgptnvim.lua

vim.notify("Loading chatgptnvim.lua configuration...", vim.log.levels.INFO)

-- OpenAI API key setup
local openai_api_key = os.getenv("OPENAI_API_KEY") or ""

vim.notify("ChatGPT open AI keyis loaded", vim.log.levels.INFO);

-- Ensure the API key is set
if openai_api_key == "" then
    vim.notify("OpenAI API key is not set. Please provide it in chatgpt_config.lua.", vim.log.levels.ERROR)
    return
end

-- Plugin setup
require('chatgptnvim').setup({
    api_key = openai_api_key,
    model = "gpt-4",
    screenPercentage = 80,
    defaultPrompt = "Improve the code with best practices:",
})

