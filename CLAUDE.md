# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Architecture

This is a macOS dotfiles repository using a symlink-based management system with modular configurations. The core philosophy emphasizes performance, modularity, and cross-tool integration.

### Symlink Management System

The `setup.sh` script is the central management tool:

```bash
# Setup all dotfiles
bash setup.sh

# Setup individual tools
bash setup.sh nvim|tmux|wezterm|aerospace|yazi|karabiner|btop

# Special zsh setup (creates both ~/.zshrc and ~/.config/zsh/)
bash setup.sh zsh
```

**Important**: The script automatically removes existing configurations before creating symlinks. Zsh has special handling - `zshrc` goes to `~/.zshrc` while the entire `zsh/` directory is symlinked to `~/.config/zsh/`.

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

