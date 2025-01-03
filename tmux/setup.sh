#!/bin/bash

# tmux/setup.sh

# Exit script on any error
set -e

# Define paths
TPM_DIR="$HOME/.tmux/plugins/tpm"
CONFIG_DIR="$HOME/.config/tmux"
CONFIG_FILE="tmux.conf"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Step 1: Clone TPM repository if not already present
if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning TPM (Tmux Plugin Manager) into $TPM_DIR..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM is already installed at $TPM_DIR."
fi

# Step 2: Ensure configuration directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Creating tmux configuration directory at $CONFIG_DIR..."
    mkdir -p "$CONFIG_DIR"
fi

# Step 3: Create symbolic link for the tmux configuration file
if [ ! -L "$CONFIG_DIR/$CONFIG_FILE" ]; then
    echo "Creating symbolic link for tmux configuration..."
    ln -s "$SCRIPT_DIR/$CONFIG_FILE" "$CONFIG_DIR/$CONFIG_FILE"
    echo "Symlink created: $SCRIPT_DIR/$CONFIG_FILE -> $CONFIG_DIR/$CONFIG_FILE"
else
    echo "Symbolic link for tmux configuration already exists."
fi

# Step 4: Notify user about plugin installation
echo
echo "Setup complete! To install tmux plugins:"
echo "1. Start a new tmux session."
echo "2. Press 'Ctrl+A' then 'I' (capital i) to install plugins."
echo
echo "Happy tmuxing!"

