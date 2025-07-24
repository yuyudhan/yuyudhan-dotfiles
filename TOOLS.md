# 🛠️ Tool Configuration Reference

> **Quick reference guide for all configured development tools and applications**

## 📝 Development Tools

### Neovim (Editor)
**Config Location**: `nvim/` | **Plugin Manager**: lazy.nvim | **Base**: LazyVim

```bash
# Management Commands
nvim                         # Launch editor
:Lazy sync                   # Update all plugins
:Mason                       # Package installer UI
:LazyVim                     # LazyVim commands

# Key Bindings
<space>                      # Leader key
<leader>z + <action>         # Custom productivity bindings
<leader>ff                   # Find files (Telescope)
<leader>sg                   # Live grep search
<leader>e                    # File explorer (Neo-tree)
```

**Plugin Categories**:
- **AI**: Avante.nvim, Claude Code integration
- **LSP**: Mason, Glance, inc-rename
- **Navigation**: Flash, Harpoon, Aerial, Telescope
- **Editing**: Better-escape, substitute, treesj, surround
- **Git**: Diffview, GitSigns
- **UI**: Noice, bufferline, notify, indent-blankline
- **Productivity**: Auto-session, undotree, which-key

---

### Tmux (Terminal Multiplexer)
**Config Location**: `tmux/tmux.conf` | **Plugin Manager**: TPM | **Prefix**: `Ctrl+O`

```bash
# Session Management
tmux new -s <name>           # Create named session
tmux attach -t <name>        # Attach to session
tmux list-sessions           # List all sessions

# Plugin Management
<Prefix> + I                 # Install plugins
<Prefix> + U                 # Update plugins
<Prefix> + r                 # Reload configuration

# Navigation
<Prefix> + h/j/k/l          # Vim-style pane navigation
<Prefix> + |                # Vertical split
<Prefix> + -                # Horizontal split
```

**Plugin Categories**:
- **Session**: resurrect, continuum, sessionist
- **Navigation**: vim-tmux-navigator, fzf
- **Productivity**: which-key, copycat, open, yank
- **Monitoring**: net-speed, online-status
- **UI**: power (gold theme), prefix-highlight
- **System**: logging, sidebar, floating-terminal

---

### Zsh (Shell)
**Config Location**: `zsh/` | **Plugin Manager**: Zinit | **Theme**: Powerlevel10k

```bash
# Configuration Management
source ~/.zshrc              # Reload configuration
reloadshell                  # Alias for reload
zprof                        # Performance profiling (when enabled)

# Enhanced History (Atuin)
atuin search <term>          # Enhanced history search
atuin stats                  # History statistics

# Navigation Aliases
cd <partial-name>            # Auto-complete with zoxide
z <fuzzy-match>              # Jump to directory
ls / ll / la / lt           # Enhanced listing (eza)
```

**Configuration Modules**:
- **01-core.zsh**: Core settings, history, Atuin integration
- **02-environment.zsh**: Environment variables, editor settings
- **03-path.zsh**: PATH management for languages and tools
- **04-languages.zsh**: Language-specific configurations
- **05-utilities.zsh**: Utility aliases and functions
- **06-file-management.zsh**: File operation shortcuts
- **07-navigation.zsh**: Navigation aliases, zoxide integration
- **08-git.zsh**: Git workflow aliases
- **09-tmux.zsh**: Tmux integration and shortcuts
- **10-system.zsh**: System-level aliases
- **99-plugins.zsh**: Plugin loading (minimal for performance)

---

## 🖥️ System Tools

### WezTerm (Terminal Emulator)
**Config Location**: `wezterm/wezterm.lua` | **Language**: Lua

```lua
-- Key Features
theme = "Gruvbox Dark"
font = "JetBrainsMono Nerd Font"
fps = 60
transparency = true
gpu_acceleration = true
```

**Features**:
- GPU-accelerated rendering
- Gruvbox Dark theme
- Nerd Font support
- Transparency and blur effects
- Tmux integration
- Multiplexing support

---

### Aerospace (Window Manager)
**Config Location**: `aerospace/aerospace.toml` | **Type**: Tiling WM

```bash
# Workspace Management
aerospace list-workspaces    # Show all workspaces  
aerospace move-window-to <ws># Move window to workspace
aerospace workspace <number> # Switch to workspace

# Window Operations
aerospace layout <type>      # Change layout (bsp, accordion)
aerospace resize <direction> # Resize windows
aerospace move <direction>   # Move window focus
```

**Features**:
- BSP (Binary Space Partitioning) tiling
- Multiple workspace support
- Keyboard-driven interface
- macOS integration
- Configurable layouts

---

### Karabiner Elements (Keyboard Customizer)
**Config Location**: `karabiner/karabiner.json` | **Type**: JSON

**Key Modifications**:
- Custom key mappings
- Application-specific bindings
- Complex modifications
- Hardware keyboard support
- Modifier key remapping

**Common Customizations**:
- Caps Lock → Escape/Control
- Function key behaviors
- External keyboard layouts
- App-specific shortcuts

---

## 📁 File & System Management

### Yazi (File Manager)
**Config Location**: `yazi/config.yml` | **Theme**: OneDark

```bash
# Navigation
yazi                         # Launch file manager
h/j/k/l                      # Vim-style navigation
Space                        # Select files
Enter                        # Open file/directory
q                            # Quit
```

**Features**:
- Modern TUI file manager
- Vim-style navigation
- File operations
- Directory tree view
- Theming support

---

### Btop (System Monitor)
**Config Location**: `btop/btop.conf` | **Type**: System monitoring

```bash
btop                         # Launch system monitor
```

**Features**:
- CPU, memory, disk, network monitoring
- Process management
- Custom themes
- Real-time updates
- Resource graphs

---

## 🌐 Browser & Productivity

### SurfingKeys (Browser Extension)
**Config Location**: `surfingkeys/surfing-keys.js` | **Type**: Browser automation

**Key Features**:
- Vim-like browser navigation
- Custom key bindings
- Tab management
- Search shortcuts
- Page navigation

**Common Bindings**:
- `j/k` - Scroll down/up
- `f` - Follow links
- `t` - New tab
- `/` - Search in page

---

### Raycast (Launcher & Productivity)
**Config Location**: `raycast/` | **Type**: Import-only snippets

**Features**:
- Text expansion snippets
- Custom commands
- Productivity shortcuts
- System integration
- Import/export support

**Usage**:
1. Import `snippets.json` into Raycast
2. Use snippet triggers for text expansion
3. Customize shortcuts as needed

---

## 🎛️ Configuration Management

### Setup Scripts

#### setup.sh (Symlink Manager)
```bash
# Usage Examples
bash setup.sh               # Setup all configurations
bash setup.sh nvim          # Setup only Neovim
bash setup.sh zsh           # Special zsh setup (dual symlinks)
```

**Features**:
- Automatic symlink creation
- Existing file cleanup
- Individual tool setup
- Error handling
- Validation checks

#### install.sh (Environment Bootstrap)
```bash
bash install.sh             # Full macOS development setup
```

**Installs**:
- Homebrew package manager
- Development tools (Node, Go, Rust, Python)
- GUI applications (VS Code, Docker, etc.)
- CLI utilities (ripgrep, fd, bat, eza)
- LSP servers and formatters via Mason
- Oh My Zsh framework

---

## 🔧 Development Environment

### Language Support

#### Language Servers (LSP)
**Managed by**: Mason.nvim | **Configuration**: `nvim/lua/config/lsp.lua`

**Supported Languages**:
- **JavaScript/TypeScript**: ts_ls, eslint
- **Python**: basedpyright (improved pyright fork)
- **Go**: gopls
- **Rust**: rust-analyzer (via rustaceanvim)
- **Lua**: lua_ls
- **HTML/CSS**: html, css, tailwindcss
- **JSON/YAML**: json-lsp, yaml-language-server
- **Docker**: dockerfile, docker-compose
- **Markdown**: marksman
- **C/C++**: clangd
- **Shell**: bash-language-server

#### Formatters & Linters
**Auto-installed via Mason**:
- **General**: prettier, prettierd
- **JavaScript/TypeScript**: eslint, prettier
- **Python**: ruff, black, isort, mypy
- **Go**: gofumpt, goimports, golangci-lint
- **Rust**: rustfmt, clippy (via rustup)
- **Lua**: stylua
- **Shell**: shfmt, shellcheck
- **YAML**: yamlfmt, yamllint
- **Docker**: hadolint

#### Debuggers
**Available via Mason**:
- **JavaScript**: js-debug-adapter
- **Go**: go-debug-adapter
- **Rust/C++**: codelldb
- **Python**: debugpy (auto-configured)

---

## 🎨 Themes & Appearance

### Unified Theme: Gruvbox Dark
**Applied across**:
- Neovim colorscheme
- WezTerm theme
- Tmux power theme (gold variant)
- Yazi OneDark (similar palette)

### Font Configuration
**Primary Font**: JetBrainsMono Nerd Font
- **Terminal**: WezTerm
- **Editor**: Neovim
- **Features**: Programming ligatures, icon support

### Visual Enhancements
- **Transparency**: WezTerm background
- **Animations**: Mini-animate in Neovim
- **Icons**: Nerd Font icons throughout
- **Status Lines**: Rich information display

---

## 📊 Performance Configuration

### Startup Optimization
**Zsh Shell**:
- Early exit for non-interactive sessions
- Minimal plugin loading (only Powerlevel10k)
- Async initialization where possible

**Neovim**:
- Lazy loading for all plugins
- Disabled unused built-in plugins
- Optimized plugin loading order

**Tmux**:
- Efficient plugin selection
- Optimized key bindings
- Session persistence

### Resource Management
**Memory Usage**:
- Lazy loading strategies
- Plugin selection based on necessity
- Efficient caching mechanisms

**Disk Usage**:
- Compressed plugin installations
- Shared dependencies
- Regular cleanup routines

---

## 🔗 Integration Points

### Cross-Tool Integration
**vim-tmux-navigator**:
- Seamless navigation between Vim/Tmux panes
- Unified key bindings (`Ctrl+h/j/k/l`)
- Consistent behavior across tools

**Unified Theming**:
- Gruvbox Dark color scheme
- Consistent visual appearance
- Coordinated UI elements

**Shell Integration**:
- Tmux session management from shell
- Directory navigation with zoxide
- Enhanced command history with Atuin

### AI Integration
**Claude Code**:
- Comprehensive CLAUDE.md documentation
- AI-assisted development workflow
- Intelligent code suggestions

**Avante.nvim**:
- AI chat within editor
- Code explanation and generation
- Contextual assistance

---

## 🎯 Quick Command Reference

### Essential Daily Commands
```bash
# Launch Development Environment
tmux new -s dev              # Create dev session
nvim                         # Open editor
yazi                         # File manager

# Configuration Management
bash setup.sh               # Apply configurations
source ~/.zshrc              # Reload shell
<Prefix> + r                 # Reload tmux

# Plugin Management
:Lazy sync                   # Update Neovim plugins
<Prefix> + I                 # Install tmux plugins

# System Monitoring
btop                         # System monitor
```

### Git Workflow (from zsh aliases)
```bash
gs                           # git status
ga <files>                   # git add
gc -m "message"              # git commit
gp                           # git push
gl                           # git pull
gd                           # git diff
lg                           # lazygit
```

### File Operations
```bash
ls / ll / la                 # Enhanced listing (eza)
cat <file>                   # Enhanced cat (bat)
grep <pattern>               # Enhanced grep (ripgrep)
find <name>                  # Enhanced find (fd)
z <directory>                # Jump to directory (zoxide)
```

---

*This tool reference is automatically maintained and reflects the current state of configurations. Last updated: 2024-07-22*