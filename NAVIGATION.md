# 🧭 Documentation Navigation Guide

> **Quick navigation reference for all documentation in this repository**

## 📚 Documentation Hierarchy

### 🏠 Root Level Documentation
- **[README.md](README.md)** - Project overview and basic usage
- **[INDEX.md](INDEX.md)** - Comprehensive project index and architecture guide
- **[TOOLS.md](TOOLS.md)** - Complete tool configuration reference
- **[NAVIGATION.md](NAVIGATION.md)** - This navigation guide
- **[CLAUDE.md](CLAUDE.md)** - Claude Code integration and repository architecture

## 🔍 Find Documentation By Purpose

### 🚀 Getting Started
| Document | Purpose | Audience |
|----------|---------|----------|
| [README.md](README.md) | Quick project overview | New users |
| [INDEX.md](INDEX.md) | Complete setup guide | All users |
| [install.sh](install.sh) | Environment bootstrap script | New macOS setups |
| [setup.sh](setup.sh) | Configuration deployment | Existing systems |

### 🛠️ Tool Configuration
| Tool | Primary Doc | Additional Resources |
|------|-------------|---------------------|
| **Neovim** | [nvim/CLAUDE.md](nvim/CLAUDE.md) | [nvim/LSP.md](nvim/LSP.md), [nvim/README.md](nvim/README.md) |
| **Tmux** | [TOOLS.md#tmux](TOOLS.md#tmux-terminal-multiplexer) | Plugin docs in `tmux/plugins/*/README.md` |
| **Zsh** | [zsh/CLAUDE.md](zsh/CLAUDE.md) | [TOOLS.md#zsh](TOOLS.md#zsh-shell) |
| **WezTerm** | [TOOLS.md#wezterm](TOOLS.md#wezterm-terminal-emulator) | [wezterm/wezterm.lua](wezterm/wezterm.lua) |
| **All Tools** | [TOOLS.md](TOOLS.md) | Individual config files |

### 🏗️ Architecture & Development
| Document | Focus | Details |
|----------|-------|---------|
| [CLAUDE.md](CLAUDE.md) | Repository architecture | Symlink system, conventions |
| [INDEX.md#architecture](INDEX.md#-architecture-patterns) | Design patterns | Modular design, file organization |
| [TOOLS.md#integration](TOOLS.md#-integration-points) | Cross-tool integration | Unified theming, vim-tmux-navigator |

## 🎯 Navigation by User Type

### 👶 New to Dotfiles
**Recommended Reading Order**:
1. [README.md](README.md) - Understand what this repository does
2. [INDEX.md#setup-installation](INDEX.md#-setup--installation) - Installation guide
3. [TOOLS.md](TOOLS.md) - Learn about configured tools
4. Tool-specific docs as needed

### 🔧 Experienced Users
**Quick Reference**:
- [TOOLS.md](TOOLS.md) - Command reference for all tools
- [INDEX.md#command-reference](INDEX.md#-command-reference) - Setup commands
- Specific `*/CLAUDE.md` files for detailed configurations

### 👨‍💻 Developers & Customizers
**Deep Dive Resources**:
- [CLAUDE.md](CLAUDE.md) - Architecture and conventions
- [nvim/CLAUDE.md](nvim/CLAUDE.md) - Neovim plugin ecosystem
- [INDEX.md#architecture-patterns](INDEX.md#-architecture-patterns) - Design principles

### 🤖 Claude Code Users
**AI Integration Docs**:
- [CLAUDE.md](CLAUDE.md) - Repository integration guide
- [nvim/CLAUDE.md](nvim/CLAUDE.md) - Editor-specific guidance
- [INDEX.md](INDEX.md) - Comprehensive reference

## 📂 Documentation by Location

### Root Directory
```
├── README.md              # Project overview
├── INDEX.md               # Comprehensive index
├── TOOLS.md               # Tool reference
├── NAVIGATION.md          # This guide
├── CLAUDE.md              # Claude Code integration
├── install.sh             # Environment setup script
└── setup.sh               # Configuration deployment script
```

### Tool-Specific Documentation
```
├── nvim/
│   ├── CLAUDE.md          # Neovim configuration guide
│   ├── CLAUDE.local.md    # Local customizations
│   ├── LSP.md             # Language server reference
│   └── README.md          # LazyVim overview
├── zsh/
│   └── CLAUDE.md          # Zsh configuration guide
└── tmux/
    └── plugins/*/README.md # Plugin documentation
```

## 🔗 Cross-Reference Index

### Configuration Files → Documentation
| Configuration | Documentation | Quick Link |
|---------------|---------------|------------|
| `nvim/init.lua` | [nvim/CLAUDE.md](nvim/CLAUDE.md) | Editor setup |
| `zsh/zshrc` | [zsh/CLAUDE.md](zsh/CLAUDE.md) | Shell configuration |
| `tmux/tmux.conf` | [TOOLS.md#tmux](TOOLS.md#tmux-terminal-multiplexer) | Terminal multiplexer |
| `wezterm/wezterm.lua` | [TOOLS.md#wezterm](TOOLS.md#wezterm-terminal-emulator) | Terminal emulator |
| `setup.sh` | [INDEX.md#setup](INDEX.md#-setup--installation) | Configuration deployment |

### Features → Documentation
| Feature | Primary Doc | Details |
|---------|-------------|---------|
| **LSP Configuration** | [nvim/LSP.md](nvim/LSP.md) | Language servers, formatters, linters |
| **Plugin Management** | [nvim/CLAUDE.md](nvim/CLAUDE.md) | lazy.nvim, Mason, TPM |
| **AI Integration** | [CLAUDE.md](CLAUDE.md) | Claude Code, Avante.nvim |
| **Shell Productivity** | [zsh/CLAUDE.md](zsh/CLAUDE.md) | Aliases, history, navigation |
| **Cross-Tool Navigation** | [TOOLS.md#integration](TOOLS.md#-integration-points) | vim-tmux-navigator |

### Troubleshooting → Documentation
| Issue | Documentation | Section |
|-------|---------------|---------|
| **Setup Problems** | [INDEX.md](INDEX.md) | Setup & Installation |
| **Plugin Issues** | [nvim/CLAUDE.md](nvim/CLAUDE.md) | Plugin Management |
| **Shell Performance** | [zsh/CLAUDE.md](zsh/CLAUDE.md) | Performance section |
| **Tmux Key Bindings** | [TOOLS.md#tmux](TOOLS.md#tmux-terminal-multiplexer) | Commands reference |
| **LSP Not Working** | [nvim/LSP.md](nvim/LSP.md) | Troubleshooting section |

## 🎨 Documentation Conventions

### File Naming Patterns
- **README.md**: General overview of directory/tool
- **CLAUDE.md**: Comprehensive configuration guide for Claude Code
- **CLAUDE.local.md**: Local customizations and overrides
- **LSP.md**: Language server specific documentation
- **INDEX.md**: Project-wide comprehensive index
- **TOOLS.md**: Tool reference and command guide
- **NAVIGATION.md**: Documentation navigation guide

### Content Structure
```markdown
# Tool Name - Purpose

## Overview
Brief description and key features

## Configuration
File locations and structure

## Usage
Commands and key bindings

## Features
Detailed feature descriptions

## Integration
Cross-tool connections

## Troubleshooting
Common issues and solutions
```

### Link Conventions
- **Absolute links**: For files in root directory
- **Relative links**: For files in same directory
- **Anchor links**: For sections within same document
- **External links**: For upstream documentation

## 🎯 Quick Access Commands

### Find Documentation
```bash
# Search all documentation
grep -r "term" **/*.md

# List all documentation files  
find . -name "*.md" | sort

# View documentation structure
tree -P "*.md"
```

### Common Documentation Paths
```bash
# Core documentation
cat README.md
cat INDEX.md  
cat TOOLS.md

# Tool-specific guides
cat nvim/CLAUDE.md
cat zsh/CLAUDE.md
cat nvim/LSP.md

# Configuration examples
cat nvim/init.lua
cat zsh/zshrc
cat tmux/tmux.conf
```

## 🚀 Quick Start Navigation

### I want to... → Go to...
- **Set up everything quickly** → [README.md](README.md) + [setup.sh](setup.sh)
- **Understand the architecture** → [INDEX.md](INDEX.md) + [CLAUDE.md](CLAUDE.md)
- **Configure a specific tool** → [TOOLS.md](TOOLS.md) + `tool/CLAUDE.md`
- **Customize Neovim** → [nvim/CLAUDE.md](nvim/CLAUDE.md) + [nvim/LSP.md](nvim/LSP.md)
- **Optimize shell performance** → [zsh/CLAUDE.md](zsh/CLAUDE.md)
- **Learn all commands** → [TOOLS.md](TOOLS.md) + [INDEX.md#command-reference](INDEX.md#-command-reference)
- **Integrate with Claude Code** → [CLAUDE.md](CLAUDE.md) + tool-specific `CLAUDE.md` files
- **Troubleshoot issues** → Specific tool documentation + troubleshooting sections

## 📱 Mobile-Friendly Links

### Essential Documentation (Short URLs)
- **Setup**: [README.md](README.md) 
- **Complete Guide**: [INDEX.md](INDEX.md)
- **Tools**: [TOOLS.md](TOOLS.md)
- **Editor**: [nvim/CLAUDE.md](nvim/CLAUDE.md)
- **Shell**: [zsh/CLAUDE.md](zsh/CLAUDE.md)

---

## 🔄 Documentation Maintenance

### Keeping Docs Updated
- **Add new tools**: Update [INDEX.md](INDEX.md) and [TOOLS.md](TOOLS.md)
- **Configuration changes**: Update relevant `CLAUDE.md` files
- **New features**: Document in appropriate tool section
- **Cross-references**: Update navigation links

### Documentation Standards
- **File paths**: Always use relative paths
- **Command examples**: Include working examples
- **Cross-references**: Link to related documentation
- **Update dates**: Maintain last-updated timestamps

---

*This navigation guide is automatically updated to reflect current documentation structure.*
*Last updated: 2024-07-22*