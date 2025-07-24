# @yuyudhan's Neovim Configuration

Custom Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Features

### Core

- 4-space indentation
- Custom keybindings under `<leader>z` prefix
- Modular plugin organization (`<category>.<plugin-name>.lua` pattern)

### AI Integration

- Claude Sonnet 4 via Avante.nvim (manual invocation only)
- No auto-suggestions

### Language Support

LSP servers auto-installed via Mason:

- TypeScript/JavaScript, Go, Rust, Python
- C/C++, Lua, HTML/CSS
- Docker, Terraform, Ansible
- 20+ languages total

### Key Plugins

- **Navigation**: Flash, Harpoon, Aerial
- **Git**: Gitsigns, Diffview
- **UI**: Noice, Bufferline, Notify
- **Testing**: Neotest
- **Diagnostics**: Trouble, Glance

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- Nerd Font
- Node.js >= 16
- Make
- Ripgrep

### Setup

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone and setup
git clone https://github.com/yuyudhan/yuyudhan-dotfiles.git
cd yuyudhan-dotfiles
bash setup.sh nvim

# Launch Neovim
nvim
```

## Key Mappings

Leader: `<Space>`

| Mapping       | Description        |
| ------------- | ------------------ |
| `<leader>zff` | Format file        |
| `<leader>zif` | Re-indent file     |
| `<leader>ha`  | Add to Harpoon     |
| `<leader>co`  | Toggle outline     |
| `<leader>xx`  | Toggle diagnostics |
| `s`           | Flash jump         |
| `gs`          | Substitute         |

Run `:WhichKey` for all mappings.

## File Structure

```
nvim/
├── init.lua
├── lua/
│   ├── config/
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   ├── lsp.lua
│   │   └── options.lua
│   └── plugins/
│       └── <category>.<plugin>.lua
└── CLAUDE.md
```

## License

MIT

---

[@yuyudhan](https://github.com/yuyudhan)

