-- FilePath: lua/config/productivity.lua
--
-- This file contains additional productivity configurations that enhance the Neovim editing experience with better diagnostics, terminal handling, and workflow optimizations.

-- LSP Diagnostic Configuration for better error/warning display
vim.diagnostic.config({
    -- Virtual text configuration - shows errors/warnings inline
    virtual_text = {
        enabled = true, -- Enable virtual text display
        spacing = 2, -- Add spacing between text and diagnostic
        prefix = "●", -- Use bullet point as prefix
        severity_sort = true, -- Sort diagnostics by severity
        format = function(diagnostic)
            return string.format("%s (%s)", diagnostic.message, diagnostic.source)
        end,
    },
    -- Signs configuration - symbols in the sign column
    signs = {
        priority = 20, -- Higher priority than other signs
        text = {
            [vim.diagnostic.severity.ERROR] = "✘", -- Error symbol
            [vim.diagnostic.severity.WARN] = "▲", -- Warning symbol
            [vim.diagnostic.severity.INFO] = "⚑", -- Info symbol
            [vim.diagnostic.severity.HINT] = "⚐", -- Hint symbol
        },
    },
    -- Underline configuration - underline problematic code
    underline = {
        enabled = true, -- Enable underline diagnostics
        severity = vim.diagnostic.severity.ERROR, -- Only underline errors
    },
    -- Floating window configuration for detailed diagnostic info
    float = {
        enabled = true, -- Enable floating diagnostic windows
        focusable = false, -- Don't allow focusing the float
        style = "minimal", -- Minimal window style
        border = "rounded", -- Rounded borders
        source = "always", -- Always show diagnostic source
        header = "", -- No header text
        prefix = "", -- No prefix text
        suffix = "", -- No suffix text
        format = function(diagnostic)
            return string.format("%s\n(%s)", diagnostic.message, diagnostic.source)
        end,
    },
    -- Severity sorting - show more severe diagnostics first
    severity_sort = true,
    -- Update diagnostics during insert mode
    update_in_insert = false, -- Don't update diagnostics while typing
})

-- Better completion behavior for enhanced coding experience
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Better completion menu behavior
vim.opt.shortmess:append("c") -- Don't show completion messages
vim.opt.pumheight = 10 -- Limit popup menu height to 10 items

-- Terminal configuration for better terminal integration
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        -- Terminal-specific settings for better UX
        vim.opt_local.number = false -- Disable line numbers in terminal
        vim.opt_local.relativenumber = false -- Disable relative line numbers
        vim.opt_local.signcolumn = "no" -- Hide sign column in terminal
        vim.opt_local.foldcolumn = "0" -- Hide fold column in terminal
        vim.opt_local.spell = false -- Disable spell checking in terminal
        vim.opt_local.wrap = true -- Enable line wrapping in terminal
        vim.opt_local.cursorline = false -- Disable cursor line highlighting

        -- Start in insert mode when opening terminal
        vim.cmd("startinsert")
    end,
    desc = "Terminal buffer configuration for better UX",
})

-- Enhanced search configuration for better find/replace workflow
vim.opt.grepprg = "rg --vimgrep --smart-case --follow" -- Use ripgrep for better search
vim.opt.grepformat = "%f:%l:%c:%m" -- Format for grep output

-- Better diff configuration for git and file comparisons
vim.opt.diffopt:append({
    "internal", -- Use internal diff algorithm
    "filler", -- Show filler lines
    "closeoff", -- Close diff when one window closes
    "hiddenoff", -- Don't use diff mode for hidden buffers
    "algorithm:patience", -- Use patience algorithm for better diffs
    "indent-heuristic", -- Use indent-based heuristic
})

-- Improved wildmenu configuration for better command-line completion
vim.opt.wildmode = { "longest:full", "full" } -- Better command-line completion
vim.opt.wildignore:append({
    "*.o",
    "*.obj",
    "*.exe",
    "*.so",
    "*.dll", -- Compiled files
    "*.pyc",
    "*.pyo",
    "*.class", -- Python/Java compiled files
    "*.swp",
    "*.swo",
    "*.tmp", -- Temporary files
    "*.DS_Store",
    "*.localized", -- macOS files
    "node_modules/**",
    "bower_components/**", -- Node.js directories
    ".git/**",
    ".hg/**",
    ".svn/**", -- Version control
    "*.min.js",
    "*.min.css", -- Minified files
})

-- Better session management for project workflow
vim.opt.sessionoptions = {
    "buffers", -- Save buffer list
    "curdir", -- Save current directory
    "folds", -- Save fold information
    "help", -- Save help windows
    "tabpages", -- Save tab pages
    "winsize", -- Save window sizes
    "globals", -- Save global variables
}

-- Enhanced undo configuration for better history management
vim.opt.undolevels = 10000 -- Increase undo levels
vim.opt.undoreload = 10000 -- Maximum lines to save for undo on buffer reload

-- Better formatting options for consistent code style
vim.opt.formatoptions:append("r")  -- Continue comments when pressing Enter
vim.opt.formatoptions:append("o")  -- Continue comments when pressing o or O
vim.opt.formatoptions:append("q")  -- Allow formatting comments with gq
vim.opt.formatoptions:append("n")  -- Recognize numbered lists
vim.opt.formatoptions:append("j")  -- Remove comment leader when joining lines

vim.opt.formatoptions:remove("t")  -- Don't auto-wrap text
vim.opt.formatoptions:remove("c")  -- Don't auto-wrap comments
vim.opt.formatoptions:remove("a")  -- Don't auto-format paragraphs

-- Enhanced fold configuration for better code navigation
vim.opt.foldlevelstart = 99 -- Start with all folds open
vim.opt.foldnestmax = 3 -- Limit fold nesting
vim.opt.foldminlines = 1 -- Minimum lines to create a fold

-- Better window management for multi-pane workflows
vim.opt.winminheight = 0 -- Minimum window height
vim.opt.winminwidth = 0 -- Minimum window width
vim.opt.equalalways = false -- Don't always make windows equal size

-- Enhanced error handling and debugging
vim.opt.errorbells = false -- Disable error bells
vim.opt.visualbell = false -- Disable visual bell

-- Better file handling for large projects
vim.opt.autoread = true -- Automatically reload files changed outside Neovim
vim.opt.confirm = true -- Confirm before closing unsaved buffers

-- Auto-command to reload files changed outside Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    pattern = "*",
    callback = function()
        if vim.fn.mode() ~= "c" then -- Not in command-line mode
            vim.cmd("checktime") -- Check if file needs to be reloaded
        end
    end,
    desc = "Auto-reload files changed outside Neovim",
})

-- Enhanced quickfix and location list behavior
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    pattern = "*",
    callback = function()
        vim.cmd("cwindow") -- Auto-open quickfix window
    end,
    desc = "Auto-open quickfix window after quickfix commands",
})

-- Better buffer switching behavior
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        -- Jump to last known cursor position when reopening files
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = "Jump to last cursor position when reopening files",
})

