# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is a LazyVim-based Neovim configuration with a modular plugin system. The structure follows LazyVim conventions:

- **Entry point**: `init.lua` bootstraps the configuration by requiring `config.lazy`
- **Core config**: `lua/config/` contains base configuration files
- **Plugins**: `lua/plugins/` contains individual plugin configurations
- **Plugin management**: Uses lazy.nvim for plugin management and loading

## Key Configuration Files

### Core Configuration (`lua/config/`)
- `lazy.lua` - Plugin manager setup and LazyVim integration
- `options.lua` - Neovim options (leader key, UI settings, indentation, etc.)
- `keymaps.lua` - Custom keybindings with heavy use of `<leader>z` prefix
- `lsp.lua` - LSP server configurations for multiple languages (uses ts_ls)
- `autocmds.lua` - Auto-commands for file formatting, whitespace handling
- `productivity.lua` - Enhanced productivity configurations (diagnostics, terminal, search)

### Plugin Configuration (`lua/plugins/`)
- `helpers.lua` - Custom utility functions and commands
- `colorscheme.lua` - Theme configuration
- `avante.lua` - AI assistant plugin
- `rustaceanvim.lua` - Rust development support
- `vim-tmux-navigator.lua` - Tmux integration

## Development Commands

### Code Formatting
```bash
# Format Lua code (uses stylua with config from stylua.toml)
stylua .

# Format specific file
stylua path/to/file.lua
```

### Plugin Management
```bash
# Launch Neovim and run plugin commands
nvim
:Lazy sync          # Update all plugins
:Lazy clean         # Remove unused plugins
:Lazy check         # Check plugin status
```

### Mason Package Management
```bash
# Launch Neovim and run Mason commands
nvim
:Mason              # Open Mason UI (<leader>m)
:MasonInstall <pkg> # Install specific package
:MasonUpdate        # Update all packages
:MasonLog           # View installation logs
```

All LSP servers, formatters, linters, and debuggers are automatically installed on first launch via Mason configuration.

## Custom Keybindings

The configuration uses `<leader>z` as a prefix for custom commands:
- `<leader>zff` - Format file using LSP
- `<leader>zif` - Re-indent entire file
- `<leader>zafn` - Add commented file path at top
- `<leader>zcef` - Copy entire file to clipboard
- `<leader>zclf` - Clear file contents
- `<leader>zsef` - Select entire file
- `<leader>zcdm` - Copy diagnostic message
- `<leader>zcdam` - Copy all diagnostics in file

## Language Server Protocol (LSP)

The configuration supports multiple languages through `lua/config/lsp.lua`:
- TypeScript/JavaScript (ts_ls + eslint)
- Go (gopls)
- Rust (rust_analyzer)
- Python (basedpyright - improved fork)
- Lua (lua_ls)
- HTML, CSS, Tailwind CSS
- Docker, Docker Compose
- YAML, JSON, Markdown
- C/C++ (clangd)
- Ansible, Terraform, SQL, Bash

**Auto-Installation**: All LSP servers are automatically installed via Mason on first launch.

Enhanced diagnostic configuration in `productivity.lua`:
- Custom diagnostic symbols and virtual text
- Floating windows for detailed error information
- Severity-based sorting and display

## Mason Package Management

The `mason.lua` configuration automatically installs:
- **LSP Servers**: 20+ language servers for comprehensive language support
- **Formatters**: prettier, stylua, gofumpt, ruff, clang-format, and more
- **Linters**: golangci-lint, shellcheck, hadolint, yamllint, and more
- **Debuggers**: js-debug-adapter, go-debug-adapter, codelldb, and more

See `LSP.md` for comprehensive tooling documentation including linters, formatters, and debuggers.

## Custom Utilities

The `helpers.lua` plugin provides custom commands:
- `AddNumberStart` - Add line numbers at start of lines
- `AddNumberEnd` - Add line numbers at end of lines
- `CopyRelativePath` - Copy file path to clipboard
- `IndentFile` - Re-indent entire file
- `InsertFilePathComment` - Add commented file path header
- `ClearFileContents` - Clear file contents
- `SelectEntireFile` - Select all file content
- `CopyDiagnosticMessage` - Copy LSP diagnostic info

## File Structure Requirements

The configuration enforces specific file formatting through autocmds:
- Removes trailing whitespace on save
- Ensures single blank line at end of file
- Removes multiple consecutive blank lines
- Auto-exits insert mode after 1.5 seconds of inactivity

## Productivity Enhancements

The `productivity.lua` configuration adds:
- **Enhanced diagnostics**: Custom symbols, virtual text, and floating windows
- **Better terminal integration**: Optimized settings for terminal buffers
- **Improved search**: Ripgrep integration and better diff algorithms
- **Enhanced completion**: Better popup menu behavior and completion options
- **Session management**: Comprehensive session save/restore options
- **File handling**: Auto-reload, cursor position memory, and better error handling

## Stylua Configuration

Code formatting follows `stylua.toml`:
- 4-space indentation (consistent with .editorconfig)
- 120 character line width
- Unix line endings
- Double quotes preferred
- Always use call parentheses