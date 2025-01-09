#!/bin/bash

# ~/.yuyudhan-dotfiles/setup.sh
# Script to set up symlinks for dotfiles

# Function to create symlink and handle existing files/symlinks
create_symlink() {
    local source=$1
    local target=$2

    # Ask if the user wants to create the symlink
    read -p "Do you want to create a symlink for $target? [y/N] " install_confirm
    if [[ ! "$install_confirm" =~ ^[Yy]$ ]]; then
        echo "Skipping symlink creation for $target."
        return
    fi

    if [ -L "$target" ]; then
        read -p "Symlink exists for $target. Do you want to delete it? [y/N] " delete_confirm
        if [[ "$delete_confirm" =~ ^[Yy]$ ]]; then
            rm -f "$target"
            echo "Deleted existing symlink for $target."
        else
            echo "Skipping $target."
            return
        fi
    elif [ -e "$target" ]; then
        read -p "File or directory exists at $target. Do you want to delete it? [y/N] " delete_confirm
        if [[ "$delete_confirm" =~ ^[Yy]$ ]]; then
            rm -rf "$target"
            echo "Deleted existing file or directory at $target."
        else
            echo "Skipping $target."
            return
        fi
    fi

    # Create the symlink
    if [ -d "$source" ]; then
        # If source is a directory, ensure trailing slash for clarity
        ln -s "${source}/" "$target"
    else
        ln -s "$source" "$target"
    fi
    echo "Created symlink: $target -> $source"
}

# Base directory for your dotfiles
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# List of symlinks
create_symlink "$DOTFILES_DIR/zsh/zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh" "$HOME/.config/zsh"
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
create_symlink "$DOTFILES_DIR/vim/vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/vim" "$HOME/.config/vim"
create_symlink "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"
create_symlink "$DOTFILES_DIR/aerospace" "$HOME/.config/aerospace"
create_symlink "$DOTFILES_DIR/tmux" "$HOME/.config/tmux"
create_symlink "$DOTFILES_DIR/yazi" "$HOME/.config/yazi"
create_symlink "$DOTFILES_DIR/hammerspoon" "$HOME/.hammerspoon"
create_symlink "$DOTFILES_DIR/sketchybar" "$HOME/.config/sketchybar"
create_symlink "$DOTFILES_DIR/karabiner" "$HOME/.config/karabiner"

echo "All symlinks have been created or updated."

