# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Zsh Configuration Structure

This is a modular zsh configuration that loads configuration files in a specific order through `zshrc`. The configuration is split into numbered files in the `configs/` directory for easy management.

### Loading Order

The `zshrc` file loads configurations in this order:
1. `environment.zsh` - Environment variables and basic setup
2. `plugins.zsh` - Zinit plugin manager and zsh plugins
3. `path.zsh` - PATH configuration for various tools
4. `personal_aliases` - User's personal aliases file
5. `p10k.zsh` - Powerlevel10k prompt configuration
6. `aliases.zsh` - System and tool aliases (currently commented out)
7. `message.zsh` - ASCII art startup message

### Key Components

- **Plugin Manager**: Uses Zinit for plugin management
- **Prompt**: Powerlevel10k with custom configuration
- **History**: Configured for 5000 entries with sharing across terminals
- **Core Plugins**: zsh-autosuggestions, zsh-syntax-highlighting, vim-tmux-navigator

### File Naming Convention

Configuration files use numbered prefixes (1., 2., 4., 9., 10.) to control loading order, though not all numbers are used.

### Important Notes

- Most aliases in `4.aliases.zsh` are commented out - this appears to be intentional
- Configuration expects files to be symlinked to `~/.config/zsh/` directory
- Uses XDG directories for history and zinit installation
- Includes custom shell behavior with blank lines before/after commands

### Commands

No specific build, test, or development commands are used in this shell configuration repository.