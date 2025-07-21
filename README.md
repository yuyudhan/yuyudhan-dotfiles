<!-- FilePath: README.md -->

# Yuyudhan Dotfiles

This repository contains my personal dotfiles and configurations for various tools and applications I use on macOS. The setup ensures consistency across systems and allows for quick provisioning of a new machine.

## Structure

### Root Directory

- **README.md**: Overview of the repository.
- **setup.sh**: Script to create symlinks for all dotfiles.
- **install.sh**: Installation script for required tools and dependencies.

### Directories

- **aerospace/**: Configuration for Aerospace window manager.
- **btop/**: Configuration for btop system monitor.
- **karabiner/**: Configuration for Karabiner-Elements keyboard customizer.
- **nvim/**: Neovim configuration files using Lua with LazyVim.
- **raycast/**: Raycast snippets and configurations (for import only).
- **surfingkeys/**: SurfingKeys browser extension configuration.
- **tmux/**: Tmux configuration and plugins managed by TPM.
- **wezterm/**: Configuration for WezTerm terminal emulator.
- **yazi/**: Configuration for Yazi file manager.
- **zsh/**: Zsh shell configuration, including aliases, paths, and plugin settings.

## Usage

### Setting Up

1. Clone this repository:

```sh
git clone https://github.com/yuyudhan/yuyudhan-dotfiles.git
cd yuyudhan-dotfiles
```

2. Run the setup script to create symlinks for all configurations:

```sh
bash setup.sh
```

3. For specific configurations, you can symlink individual tools:

```sh
bash setup.sh nvim    # Symlink only Neovim config
bash setup.sh tmux    # Symlink only Tmux config
bash setup.sh zsh     # Special Zsh setup
```

4. For Zsh setup specifically (creates `~/.zshrc` and `~/.config/zsh/`):

```sh
bash setup.sh zsh
```

5. Restart your terminal or source your shell configuration:

```sh
source ~/.zshrc
```

### Available Configurations

The following configurations can be symlinked individually or all at once:

- `nvim` → `~/.config/nvim`
- `wezterm` → `~/.config/wezterm`
- `aerospace` → `~/.config/aerospace`
- `tmux` → `~/.config/tmux`
- `yazi` → `~/.config/yazi`
- `karabiner` → `~/.config/karabiner`
- `btop` → `~/.config/btop`

### Zsh Configuration

The Zsh configuration is structured as follows:

- `zshrc` → symlinked to `~/.zshrc`
- Entire `zsh/` directory → symlinked to `~/.config/zsh/`
- Configuration files are organized in `zsh/configs/` for modularity

### Customization

Modify the files in their respective directories to suit your needs. Changes are automatically synced through the symlinks.

## Tools and Applications Configured

- **Neovim**: Enhanced text editor with LazyVim configuration, LSP support, and custom plugins.
- **Aerospace**: Tiling window manager for macOS.
- **WezTerm**: GPU-accelerated terminal emulator with custom themes and keybindings.
- **Tmux**: Terminal multiplexer with extensive plugin support via TPM.
- **Zsh**: Shell configuration with custom plugins, aliases, and productivity enhancements.
- **Yazi**: Modern file manager with preview capabilities.
- **Karabiner**: Keyboard customization for enhanced productivity.
- **btop**: Modern system monitor with beautiful interface.
- **Raycast**: Productivity launcher with custom snippets.
- **SurfingKeys**: Browser extension for keyboard-driven web browsing.

## Notes

- The setup script automatically removes existing configurations before creating new symlinks.
- All configurations are designed to work seamlessly together.
- Raycast configurations are for import only and not automatically symlinked.

## License

This repository is for personal use. Feel free to use or adapt it, but I provide no guarantees or support.

