-- FilePath: lua/plugins/mason.lua
--
-- This file configures Mason package manager to automatically install a curated set of LSP servers, formatters, linters, and debuggers that are conflict-free and essential for development productivity.

return {
    -- Mason: Package manager for LSP servers, DAP servers, linters, and formatters
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            -- Mason setup with UI configuration
            require("mason").setup({
                ui = {
                    border = "rounded",           -- Rounded border for Mason UI
                    width = 0.8,                 -- 80% of screen width
                    height = 0.8,                -- 80% of screen height
                    icons = {
                        package_installed = "✓",  -- Checkmark for installed packages
                        package_pending = "➜",    -- Arrow for pending installations
                        package_uninstalled = "✗", -- X for uninstalled packages
                    },
                },
                -- Installation settings
                install_root_dir = vim.fn.stdpath("data") .. "/mason",
                pip = {
                    upgrade_pip = true,          -- Automatically upgrade pip
                    install_args = {},           -- Additional pip install arguments
                },
                github = {
                    download_url_template = "https://github.com/%s/releases/download/%s/%s",
                },
                -- Logging level for Mason operations
                log_level = vim.log.levels.INFO,
            })

            -- Mason-LSPConfig integration for automatic LSP server setup
            require("mason-lspconfig").setup({
                -- Automatically install LSP servers when they're configured in lspconfig
                automatic_installation = true,
                -- Ensure these LSP servers are installed
                ensure_installed = {
                    -- Language Servers
                    "ts_ls",                     -- TypeScript/JavaScript (updated name)
                    "eslint",                    -- ESLint language server
                    "gopls",                     -- Go language server
                    "rust_analyzer",             -- Rust language server
                    "basedpyright",              -- Python language server (improved fork of pyright)
                    "html",                      -- HTML language server
                    "cssls",                     -- CSS language server
                    "tailwindcss",               -- Tailwind CSS language server
                    "jsonls",                    -- JSON language server
                    "yamlls",                    -- YAML language server
                    "dockerls",                  -- Dockerfile language server
                    "docker_compose_language_service", -- Docker Compose language service
                    "marksman",                  -- Markdown language server
                    "lua_ls",                    -- Lua language server
                    "clangd",                    -- C/C++ language server
                    "ansiblels",                 -- Ansible language server
                    "lemminx",                   -- XML language server
                    "terraformls",               -- Terraform language server
                    "systemdls",                 -- Systemd language server
                    "sqlls",                     -- SQL language server
                    "intelephense",              -- PHP language server
                    "phpactor",                  -- PHP language server (alternative)
                    "jdtls",                     -- Java language server
                    "bashls",                    -- Bash language server
                    "cmake",                     -- CMake language server
                    "taplo",                     -- TOML language server
                },
            })

            -- Mason Tool Installer for non-LSP tools (formatters, linters, debuggers)
            require("mason-tool-installer").setup({
                -- Automatically install tools when Neovim starts
                auto_update = false,          -- Don't auto-update tools (for stability)
                run_on_start = true,          -- Install missing tools on startup
                start_delay = 3000,           -- Wait 3 seconds before starting (in milliseconds)
                debounce_hours = 24,          -- Check for updates every 24 hours
                
                -- Curated list of essential development tools
                ensure_installed = {
                    -- === FORMATTERS ===
                    "prettier",                -- General purpose formatter (JS, TS, JSON, MD, etc.)
                    "prettierd",              -- Faster daemon version of prettier
                    "gofumpt",                -- Go formatter (stricter than gofmt)
                    "goimports",              -- Go import formatter and organizer
                    "ruff",                   -- Python formatter and linter (replaces black, isort, flake8)
                    "stylua",                 -- Lua formatter
                    "shfmt",                  -- Shell script formatter
                    "mdformat",               -- Markdown formatter
                    "clang-format",           -- C/C++ formatter
                    "yamlfix",                -- YAML fixer
                    "yamlfmt",                -- YAML formatter
                    "sql-formatter",          -- SQL formatter
                    "sqlfluff",               -- SQL linter and formatter
                    "pgformatter",            -- PostgreSQL formatter
                    "php-cs-fixer",           -- PHP formatter
                    "beautysh",               -- Shell script beautifier
                    "cmakelang",              -- CMake formatter
                    
                    -- === LINTERS ===
                    "golangci-lint",          -- Go linter (comprehensive)
                    "golangci-lint-langserver", -- Go linter language server
                    "hadolint",               -- Dockerfile linter
                    "shellcheck",             -- Shell script linter
                    "ansible-lint",           -- Ansible linter
                    "yamllint",               -- YAML linter
                    "tflint",                 -- Terraform linter
                    "tfsec",                  -- Terraform security scanner
                    "phpcs",                  -- PHP linter
                    "gitlint",                -- Git commit message linter
                    "checkmake",              -- Makefile linter
                    
                    -- === DEBUGGERS ===
                    "js-debug-adapter",       -- JavaScript/TypeScript debugger
                    "go-debug-adapter",       -- Go debugger (delve)
                    "cpptools",               -- C/C++ debugger
                    "codelldb",               -- LLDB adapter for Rust, C++ debugging
                    "java-debug-adapter",     -- Java debugger
                },
            })

            -- Auto-command to refresh Mason registry on startup
            vim.api.nvim_create_autocmd("User", {
                pattern = "MasonToolsStartingInstall",
                callback = function()
                    vim.schedule(function()
                        print("Mason: Starting tool installation...")
                    end)
                end,
            })

            -- Auto-command to notify when installation is complete
            vim.api.nvim_create_autocmd("User", {
                pattern = "MasonToolsUpdateCompleted",
                callback = function(e)
                    vim.schedule(function()
                        print("Mason: Tool installation completed!")
                        -- Optionally show details of what was installed
                        if e.data and #e.data > 0 then
                            print(string.format("Installed/Updated: %s", table.concat(e.data, ", ")))
                        end
                    end)
                end,
            })

            -- Keybinding to open Mason UI
            vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { 
                desc = "Open Mason package manager",
                silent = true,
                noremap = true,
            })
        end,
    },
}