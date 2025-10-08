-- FilePath: lua/plugins/formatting.conform.lua

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
        {
            "<leader>zff",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format file using conform",
        },
    },
    opts = {
        -- Define formatters by filetype
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff_format", "ruff_organize_imports" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            vue = { "prettier" },
            css = { "prettier" },
            scss = { "prettier" },
            less = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            jsonc = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            handlebars = { "prettier" },
            go = { "goimports", "gofumpt" },
            rust = { "rustfmt" },
            sh = { "shfmt" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            sql = { "sql_formatter" },
            php = { "php_cs_fixer" },
        },
        -- Customize formatters
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
            prettier = {
                -- Use the prettier installed by Mason
                command = function()
                    local mason_registry = require("mason-registry")
                    local prettier = mason_registry.get_package("prettier")
                    return prettier:get_install_path() .. "/node_modules/.bin/prettier"
                end,
            },
        },
    },
    init = function()
        -- If you want to enable format-on-save, you can set this option
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}