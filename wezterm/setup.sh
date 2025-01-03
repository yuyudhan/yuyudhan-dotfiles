# wezterm/setup.sh
#!/bin/bash

# Define source and target paths
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEZTERM_CONFIG_FILE="$SOURCE_DIR/wezterm.lua"
WEZTERM_TARGET_DIR="$HOME/.config/wezterm"

# Ensure the target directory exists
if [ ! -d "$WEZTERM_TARGET_DIR" ]; then
    echo "Creating directory: $WEZTERM_TARGET_DIR"
    mkdir -p "$WEZTERM_TARGET_DIR"
fi

# Check if the symlink already exists and create or replace it
if [ -L "$WEZTERM_TARGET_DIR/wezterm.lua" ]; then
    echo "Removing existing symlink: $WEZTERM_TARGET_DIR/wezterm.lua"
    rm "$WEZTERM_TARGET_DIR/wezterm.lua"
fi

if [ -f "$WEZTERM_TARGET_DIR/wezterm.lua" ]; then
    echo "Backing up existing file: $WEZTERM_TARGET_DIR/wezterm.lua"
    mv "$WEZTERM_TARGET_DIR/wezterm.lua" "$WEZTERM_TARGET_DIR/wezterm.lua.bak"
fi

echo "Creating symlink: $WEZTERM_CONFIG_FILE -> $WEZTERM_TARGET_DIR/wezterm.lua"
ln -s "$WEZTERM_CONFIG_FILE" "$WEZTERM_TARGET_DIR/wezterm.lua"

echo "WezTerm configuration symlink created successfully!"

