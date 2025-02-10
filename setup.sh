#!/bin/sh

# Script to set up symlinks for dotfiles

# Exit on errors
set -e

# Function to create symlink and handle existing files/symlinks
create_symlink() {
    source=$1
    target=$2

    # Show what we are about to do
    echo "Processing symlink:"
    echo "  Source: $source"
    echo "  Target: $target"

    # Check if source exists
    if [ ! -e "$source" ]; then
        echo "❌ Source does not exist at: $source"
        return
    fi

    # Prompt user for symlink creation
    echo -n "Do you want to create a symlink for $target? [y/N] "
    # Read from terminal so it doesn't get swallowed by while loops
    read install_confirm < /dev/tty

    if [ "$install_confirm" != "y" ] && [ "$install_confirm" != "Y" ]; then
        echo "❌ Skipping symlink creation for $target."
        return
    fi

    # Handle existing symlink or file
    if [ -L "$target" ]; then
        echo -n "Symlink already exists for $target. Delete it? [y/N] "
        read delete_confirm < /dev/tty
        if [ "$delete_confirm" = "y" ] || [ "$delete_confirm" = "Y" ]; then
            rm -f "$target"
            echo "🗑️  Deleted existing symlink for $target."
        else
            echo "⚠️  Skipping $target."
            return
        fi
    elif [ -e "$target" ]; then
        echo -n "File or directory exists at $target. Delete it? [y/N] "
        read delete_confirm < /dev/tty
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
obsidian $HOME/.config/obsidian
alacritty $HOME/.config/alacritty
zellij $HOME/.config/zellij
"

# Function to process all symlinks
setup_all_symlinks() {
    echo "🔧 Setting up all symlinks..."
    echo "$SYMLINKS" | while IFS= read -r line; do
        # Skip empty lines
        [ -z "$line" ] && continue

        key=$(echo "$line" | awk '{print $1}')
        target=$(echo "$line" | awk '{print $2}')
        source="$DOTFILES_DIR/$key"

        create_symlink "$source" "$target"
    done
}

# Function to process a single symlink
setup_single_symlink() {
    key=$1
    found=false

    # Use a here-string (<<<) to feed the SYMLINKS variable into the loop
    while IFS= read -r line; do
        # Skip empty lines
        [ -z "$line" ] && continue

        item=$(echo "$line" | awk '{print $1}')
        target=$(echo "$line" | awk '{print $2}')

        if [ "$item" = "$key" ]; then
            source="$DOTFILES_DIR/$item"
            create_symlink "$source" "$target"
            found=true
            break
        fi
    done <<< "$SYMLINKS"

    if [ "$found" = false ]; then
        echo "❗ Invalid option: $key"
        echo "Available options: $(echo "$SYMLINKS" | awk '{print $1}' | xargs)"
        exit 1
    fi
}

# Main logic
if [ -n "$1" ]; then
    # If a specific component is passed, only process that one
    key="$1"
    setup_single_symlink "$key"
else
    # No argument passed, process all components
    setup_all_symlinks
fi

echo "🎉 All requested symlinks have been created or updated."

