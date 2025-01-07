# Yuyudhan Dotfiles

This repository contains my personal dotfiles and configurations for various tools and applications I use on macOS. The setup ensures consistency across systems and allows for quick provisioning of a new machine.

## Structure

### Root Directory
- **README.md**: Overview of the repository.
- **setup.sh**: Script to create symlinks for all dotfiles.

### Directories

- **aerospace/**: Configuration for Aerospace.
- **hammerspoon/**: Hammerspoon scripts and Lua modules for automating macOS tasks.
- **nvim/**: Neovim configuration files using Lua.
- **sketchybar/**: Configuration for the SketchyBar macOS menu bar replacement.
- **skhd/**: Keybinding configuration using skhd.
- **tmux/**: Tmux configuration and plugins managed by TPM.
- **vim/**: Vim configuration with plugins and settings.
- **wezterm/**: Configuration for WezTerm terminal emulator.
- **yabai/**: Configuration for Yabai window manager.
- **zsh/**: Zsh shell configuration, including aliases, paths, and plugin settings.

## Usage

### Setting Up
1. Clone this repository:

```sh
git clone https://github.com/yuyudhan/yuyudhan-dotfiles.git
cd yuyudhan-dotfiles
```

2. Run the setup script to create symlinks:

```sh
./setup.sh
```

3. Restart your terminal or source your shell configuration:

```sh
source ~/.zshrc
```

### Customization
Modify the files in their respective directories to suit your needs. Changes are synced through the symlinks.

## Tools and Applications Configured
- **Neovim**: Enhanced text editor with plugins and LSP support.
- **SketchyBar**: Customizable macOS menu bar.
- **Hammerspoon**: Mac automation tool with Lua scripting.
- **Yabai**: Tiling window manager for macOS.
- **WezTerm**: GPU-accelerated terminal emulator.
- **Tmux**: Terminal multiplexer with plugin support.
- **Vim**: Classic text editor with minimal configuration.
- **Zsh**: Shell configuration with plugins and aliases.

## License
This repository is for personal use. Feel free to use or adapt it, but I provide no guarantees or support.

