#!/bin/sh

# ~/.yuyudhan-dotfiles/setup.sh
# Script to set up symlinks for dotfiles

# Exit on errors
set -e

# Function to create symlink and handle existing files/symlinks
create_symlink() {
    source=$1
    target=$2

    # Prompt user for symlink creation
    echo "Do you want to create a symlink for $target? [y/N] \c"
    read install_confirm
    if [ "$install_confirm" != "y" ] && [ "$install_confirm" != "Y" ]; then
        echo "❌ Skipping symlink creation for $target."
        return
    fi

    # Handle existing symlink or file
    if [ -L "$target" ]; then
        echo "Symlink exists for $target. Do you want to delete it? [y/N] \c"
        read delete_confirm
        if [ "$delete_confirm" = "y" ] || [ "$delete_confirm" = "Y" ]; then
            rm -f "$target"
            echo "🗑️  Deleted existing symlink for $target."
        else
            echo "⚠️  Skipping $target."
            return
        fi
    elif [ -e "$target" ]; then
        echo "File or directory exists at $target. Do you want to delete it? [y/N] \c"
        read delete_confirm
        if [ "$delete_confirm" = "y" ] || [ "$delete_confirm" = "Y" ]; then
            rm -rf "$target"
            echo "🗑️  Deleted existing file or directory at $target."
        else
            echo "⚠️  Skipping $target."
            return
        fi
    fi

    # Create the symlink
    ln -s "$source" "$target"
    echo "✅ Created symlink: $target → $source"
}

# Base directory for your dotfiles
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# List of symlink mappings (source target)
SYMLINKS="
nvim $HOME/.config/nvim
vimrc $HOME/.vimrc
vim $HOME/.config/vim
wezterm $HOME/.config/wezterm
aerospace $HOME/.config/aerospace
tmux $HOME/.config/tmux
yazi $HOME/.config/yazi
hammerspoon $HOME/.hammerspoon
sketchybar $HOME/.config/sketchybar
karabiner $HOME/.config/karabiner
btop $HOME/.config/btop
"

# Function to process Zsh configs
setup_zsh_configs() {
    echo "🔧 Setting up Zsh configuration..."
    for file in "$DOTFILES_DIR/zsh/configs/"*; do
        target="$HOME/.oh-my-zsh/custom/$(basename "$file")"
        create_symlink "$file" "$target"
    done
}

# Function to process all symlinks
setup_all_symlinks() {
    setup_zsh_configs

    echo "$SYMLINKS" | while read -r key target; do
        [ -z "$key" ] && continue # Skip empty lines
        source="$DOTFILES_DIR/$key"
        create_symlink "$source" "$target"
    done
}

# Main logic
if [ -n "$1" ]; then
    # If a specific component is passed, only process that one
    key="$1"

    if [ "$key" = "zsh" ]; then
        setup_zsh_configs
    else
        echo "$SYMLINKS" | while read -r item target; do
            if [ "$item" = "$key" ]; then
                source="$DOTFILES_DIR/$item"
                create_symlink "$source" "$target"
                exit 0
            fi
        done
        echo "❗ Invalid option: $key"
        echo "Available options: zsh $(echo "$SYMLINKS" | awk '{print $1}' | xargs)"
        exit 1
    fi
else
    # No argument passed, process all components
    echo "🔄 No specific target provided. Setting up all configurations..."
    setup_all_symlinks
fi

echo "🎉 All requested symlinks have been created or updated."

