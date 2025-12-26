# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Architecture

This is a macOS dotfiles repository using a symlink-based management system with modular configurations. The core philosophy emphasizes performance, modularity, and cross-tool integration.

### Symlink Management System

The `setup.sh` script is the central management tool with modern features:

```bash
# Setup all dotfiles
bash setup.sh

# Setup individual tools (supports multiple at once)
bash setup.sh nvim tmux wezterm

# Preview changes without making them (dry-run mode)
bash setup.sh --dry-run
bash setup.sh --dry-run zsh

# Get help and see all available options
bash setup.sh --help

# Special handlers
bash setup.sh zsh        # Creates ~/.zshrc + ~/.config/zsh/
bash setup.sh opencode   # Symlinks opencode/agent/, command/, opencode.json
```

**Key Features**:
- **Color Output**: Green=success, Yellow=warning, Red=error, Blue=info
- **Multi-Tool Support**: Setup multiple tools in one command
- **Dry-Run Mode**: Preview changes before applying
- **Smart Skipping**: Skips symlinks that are already correct
- **Summary Report**: Shows created/skipped/error counts
- **Validation**: Checks source directories exist before symlinking

**Important**: The script automatically removes existing configurations before creating symlinks. Zsh and OpenCode have special handling for multiple symlinks.

### Zsh Configuration Architecture

**Location**: `zsh/` directory
**Pattern**: Modular, numbered auto-loading system

The `zshrc` file automatically loads all `*.zsh` files from the configs directory. Configuration files use numbered prefixes for load order:

- `01-core.zsh` - Core zsh settings, history configuration
- `02-environment.zsh` - Environment variables, editor settings
- `03-path.zsh` - PATH configurations
- `04-languages.zsh` - Language-specific settings
- `05-plugins.zsh` - Plugin performance tuning
- `06-utilities.zsh` - Utility aliases
- `07-file-management.zsh` - File management shortcuts
- `08-navigation.zsh` - Navigation aliases
- `09-git.zsh` - Git workflow aliases
- `10-tmux.zsh` - Tmux integrations
- Plus additional numbered configs

**Key Features**:

- Uses Zinit plugin manager for performance
- Minimal plugin approach (only autosuggestions, syntax highlighting)
- 5000-line shared history across terminals
- Async plugin loading for performance

### Tool-Specific Configurations

**Neovim** (`nvim/`):

- LazyVim-based configuration with lazy.nvim plugin manager
- Custom plugins in `lua/plugins/`
- LSP configurations in `lua/config/lsp.lua`

**Tmux** (`tmux/`):

- Uses TPM (Tmux Plugin Manager)
- Prefix key: `Ctrl+O` (not default `Ctrl+B`)
- Gold-themed tmux-power configuration
- Extensive plugin ecosystem for sessions, resurrection, etc.

**WezTerm** (`wezterm/`):

- Gruvbox Dark theme with JetBrainsMono Nerd Font
- Performance-optimized settings (60fps, reduced animations)
- Transparency and blur effects enabled

## Documentation Structure

The repository maintains organized documentation:

**Root Level**:
- `README.md` - Project overview and quick start
- `CLAUDE.md` - This file (repository architecture for Claude Code)

**Internal Documentation** (`docs/internal-docs/`):
- `INDEX.md` - Comprehensive project index and architecture guide
- `TOOLS.md` - Complete tool configuration reference
- `NAVIGATION.md` - Documentation navigation guide

**Tool-Specific**:
- `nvim/CLAUDE.md`, `nvim/LSP.md` - Neovim configuration details
- `zsh/CLAUDE.md` - Zsh shell configuration
- `opencode/agent/`, `opencode/command/` - Custom OpenCode extensions

## Development Commands

### Installation & Setup

```bash
# Initial macOS development environment setup
bash install.sh

# Apply dotfiles configurations
bash setup.sh

# Reload shell after configuration changes
reloadshell  # (defined in zsh configs)
```

### Common Zsh Aliases

**Navigation & File Management**:

```bash
mkcd <dir>    # Create and cd to directory
path          # Display PATH in readable format
histg <term>  # Search command history
```

**Git Workflow** (from `zsh/configs/09-git.zsh`):

```bash
gs    # git status
ga    # git add
gc    # git commit
gp    # git push
gl    # git pull
gd    # git diff
gco   # git checkout
gcb   # git branch
```

### Tmux Management

- **Prefix**: `Ctrl+O`
- **Install plugins**: `Prefix + I`
- **Update plugins**: `Prefix + U`
- **Reload config**: `Prefix + r`

## Architecture Patterns

### Modular Configuration Loading

All zsh configurations use numbered prefixes to ensure predictable loading order. Any new `.zsh` file added to `zsh/configs/` will be automatically loaded.

### Performance-First Philosophy

- Minimal plugin loading with focus on essential functionality
- Async operations where possible
- Optimized terminal and editor settings

### Cross-Tool Integration

- Consistent Gruvbox Dark theming across tools
- vim-tmux-navigator for seamless navigation
- Unified keybinding philosophy

## File Structure Notes

- All configuration files include file path comments at the top
- Configurations are designed to work together as a cohesive system
- Raycast configurations are for import only (not symlinked)
- The repository maintains clean separation between tool configurations

## Important Implementation Details

1. **Zsh Auto-loading**: The system automatically loads any `.zsh` file in the configs directory - no manual sourcing required
2. **Symlink Management**: The setup script handles existing file/directory removal automatically
3. **Plugin Management**: Uses modern, performance-focused plugin managers (Zinit for zsh, lazy.nvim, TPM for tmux)
4. **macOS Integration**: Includes configurations for macOS-specific tools (Aerospace, Karabiner)
5. **Development Environment**: Comprehensive setup includes LSP servers, formatters, and modern CLI tools

