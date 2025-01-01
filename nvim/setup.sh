#!/bin/bash

# File path: nvim/setup.sh

# Ensure ~/.config directory exists
mkdir -p ~/.config

# Check if ~/.config/nvim exists and is a symlink
if [ -L ~/.config/nvim ]; then
    echo "Existing symlink found at ~/.config/nvim. Removing..."
    rm ~/.config/nvim
elif [ -d ~/.config/nvim ]; then
    echo "Existing directory found at ~/.config/nvim. Please back it up and remove it manually."
    exit 1
fi

# Symlink the nvim configuration
ln -sfn "$(pwd)/nvim/nvim" ~/.config/nvim

echo "Symlink created for nvim configuration at ~/.config/nvim"

