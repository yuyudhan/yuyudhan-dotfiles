#!/bin/bash

# Setup script for yabai and skhd configuration.
# This script creates symlinks for yabai and skhd LaunchAgents and their configuration directories.
# Ensure you run this script from the root of the repository.

# Step 1: Define absolute paths for configuration and LaunchAgent files
YABAI_PLIST="$(pwd)/yabai/LaunchAgents/com.yabai.start.plist"
SKHD_PLIST="$(pwd)/yabai/LaunchAgents/com.skhd.start.plist"
YABAI_CONFIG_DIR="$(pwd)/yabai/config/yabai"
SKHD_CONFIG_DIR="$(pwd)/yabai/config/skhd"

# Step 2: Create symlinks for LaunchAgents
echo "Creating symlinks for LaunchAgents..."
ln -sf "$YABAI_PLIST" ~/Library/LaunchAgents/com.yabai.start.plist
ln -sf "$SKHD_PLIST" ~/Library/LaunchAgents/com.skhd.start.plist
echo "LaunchAgents symlinks created successfully."

# Step 3: Create symlinks for configuration directories
echo "Creating symlinks for configuration directories..."
ln -sf "$YABAI_CONFIG_DIR" ~/.config/yabai
ln -sf "$SKHD_CONFIG_DIR" ~/.config/skhd
echo "Configuration directory symlinks created successfully."

# Step 4: Load the LaunchAgents using launchctl
echo "Loading LaunchAgents into launchctl..."
launchctl unload ~/Library/LaunchAgents/com.yabai.start.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.yabai.start.plist
launchctl unload ~/Library/LaunchAgents/com.skhd.start.plist 2>/dev/null || true
launchctl load ~/Library/LaunchAgents/com.skhd.start.plist
echo "LaunchAgents loaded successfully."

# Instructions for the user:
# This script sets up symlinks for yabai and skhd configuration directories and ensures they are started automatically at login.
# 1. Make this script executable: chmod +x yabai/setup.sh
# 2. Run the script: ./yabai/setup.sh

echo "Setup completed. yabai and skhd are now configured and will start automatically."

