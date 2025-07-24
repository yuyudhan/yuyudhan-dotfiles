<!-- FilePath: CLAUDE.md -->

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

Plugins are organized using a `<category>.<plugin-name>.lua` naming pattern:

#### AI & Assistants
- `avante.lua` - AI assistant plugin
- `claude-code.lua` - Claude integration

#### Diagnostics & LSP
- `diagnostics.trouble.lua` - Pretty diagnostics interface
- `lsp.glance.lua` - Preview definitions and references
- `lsp.inc-rename.lua` - Live preview of rename operations

#### Editing & Text Manipulation
- `editing.better-escape.lua` - Use jk/jj to exit insert mode
- `editing.substitute.lua` - Better substitute with preview
- `editing.treesj.lua` - Smart split/join for code blocks
- `nvim-surround.lua` - Surround text operations
- `vim-visual-multi.lua` - Multiple cursors

#### File Management & Navigation
- `navigation.aerial.lua` - Code outline window
- `navigation.flash.lua` - Jump anywhere with search labels
- `navigation.harpoon.lua` - Quick file navigation
- `neo-tree.lua` - File explorer

#### Focus & Productivity
- `focus.twilight.lua` - Dim inactive code portions
- `focus.zen-mode.lua` - Distraction-free coding

#### Git Integration
- `git.diffview.lua` - Better git diffs viewer
- `git.gitsigns.lua` - Git decorations and inline blame

#### History & Sessions
- `history.undotree.lua` - Visualize undo history
- `session.auto-session.lua` - Session management

#### Keys & Commands
- `keys.legendary.lua` - Command palette
- `keys.which-key.lua` - Keybinding hints

#### Language Support
- `rustaceanvim.lua` - Rust development support
- `markdown.markdown-preview.lua` - Live markdown preview

#### Package Management
- `mason.lua` - LSP, formatter, linter installer

#### Refactoring
- `refactoring.refactoring.lua` - Extract functions and variables

#### Search & Find
- `search.telescope-frecency.lua` - Smart recent files
- `search.telescope-fzf-native.lua` - Better telescope performance

#### Task Running & Testing
- `task.overseer.lua` - Task runner integration
- `test.neotest.lua` - Run tests from Neovim

#### UI Enhancements
- `ui.bufferline.lua` - Visual buffer tabs
- `ui.indent-blankline.lua` - Indentation guides
- `ui.noice.lua` - Complete UI overhaul
- `ui.nvim-notify.lua` - Beautiful notifications
- `colorscheme.lua` - Theme configuration

#### Utilities
- `folding.nvim-ufo.lua` - Enhanced code folding
- `helpers.lua` - Custom utility functions and commands
- `mini-nvim.lua` - Collection of minimal modules
- `quickfix.nvim-bqf.lua` - Enhanced quickfix window
- `todo-comments.lua` - Highlight TODO/FIXME comments
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

