#!/bin/bash

# Setup script for Vim configuration.
# This script creates symlinks for the Vim directory and .vimrc file,
# and installs plugins using :PlugInstall.

# Step 1: Define paths for Vim configuration
VIM_DIR="$(pwd)/vim/vim" # Correctly points to the vim/vim directory
VIMRC_FILE="$(pwd)/vim/vimrc"

# Step 2: Remove existing symlinks or directories
echo "Cleaning up old Vim configuration..."
if [ -L ~/.vim ]; then
    rm ~/.vim # Remove symlink if it exists
elif [ -d ~/.vim ]; then
    echo "Error: ~/.vim is a directory, not a symlink. Remove it manually to proceed."
    exit 1
fi

if [ -L ~/.vimrc ]; then
    rm ~/.vimrc # Remove symlink if it exists
elif [ -f ~/.vimrc ]; then
    echo "Error: ~/.vimrc is a file, not a symlink. Remove it manually to proceed."
    exit 1
fi

# Step 3: Create symlinks for Vim configuration
echo "Creating symlinks for Vim configuration..."
ln -sf "$VIM_DIR" ~/.vim # Links vim/vim to ~/.vim
ln -sf "$VIMRC_FILE" ~/.vimrc # Links vimrc to ~/.vimrc
echo "Symlinks for Vim configuration created successfully."

# Step 4: Automatically run :PlugInstall in Vim
echo "Installing plugins with :PlugInstall..."
vim +PlugInstall +qall
if [ $? -eq 0 ]; then
    echo "Plugins installed successfully."
else
    echo "Error occurred during plugin installation."
fi

# Instructions for the user:
# This script sets up Vim by creating symlinks for its configuration
# and automatically installing plugins via :PlugInstall.
# 1. Make this script executable: chmod +x vim/setup.sh
# 2. Run the script: ./vim/setup.sh

echo "Vim setup completed."

