#!/bin/bash

# zsh/setup.sh

# Exit on errors
set -e

# Define paths
CONFIG_DIR="$HOME/.config/zsh"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$REPO_DIR/zsh"  # Directory containing Zsh configurations
ZSHRC_FILE="$SOURCE_DIR/zshrc"  # Main zshrc file in repository

# Step 1: Remove existing symlink and recreate ~/.config/zsh
if [ -L "$CONFIG_DIR" ]; then
  echo "Removing existing symlink: $CONFIG_DIR"
  rm "$CONFIG_DIR"
elif [ -e "$CONFIG_DIR" ]; then
  echo "Error: $CONFIG_DIR exists and is not a symlink. Remove it manually."
  exit 1
fi
echo "Linking $SOURCE_DIR to $CONFIG_DIR..."
ln -s "$SOURCE_DIR" "$CONFIG_DIR"

# Step 2: Remove existing symlink and recreate ~/.zshrc
if [ -L "$HOME/.zshrc" ]; then
  echo "Removing existing symlink: $HOME/.zshrc"
  rm "$HOME/.zshrc"
elif [ -e "$HOME/.zshrc" ]; then
  echo "Error: $HOME/.zshrc exists and is not a symlink. Remove it manually."
  exit 1
fi
echo "Linking $ZSHRC_FILE to ~/.zshrc..."
ln -s "$ZSHRC_FILE" "$HOME/.zshrc"

echo "Setup complete! Your Zsh configuration is now managed in $SOURCE_DIR."

