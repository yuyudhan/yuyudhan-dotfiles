#!/bin/bash

# File path: aerospace/setup.sh

# Constants
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AEROSPACE_SOURCE="$CURRENT_DIR/aerospace.toml"
AEROSPACE_DEST_DIR="$HOME/.config/aerospace"
AEROSPACE_DEST="$AEROSPACE_DEST_DIR/aerospace.toml"

# Logging utility
log() {
  local LEVEL=$1
  shift
  echo "[$LEVEL] $*"
}

# Function to create symlink
create_symlink() {
  local SOURCE=$1
  local DEST=$2

  if [ -e "$DEST" ] || [ -L "$DEST" ]; then
    log "WARN" "File $DEST already exists. Removing existing file/symlink."
    rm -rf "$DEST"
  fi

  ln -s "$SOURCE" "$DEST"
  if [ $? -eq 0 ]; then
    log "INFO" "Symlink created: $SOURCE -> $DEST"
  else
    log "ERROR" "Failed to create symlink: $SOURCE -> $DEST"
  fi
}

# Symlink aerospace.toml
log "INFO" "Setting up symlink for aerospace.toml..."
mkdir -p "$AEROSPACE_DEST_DIR"
create_symlink "$AEROSPACE_SOURCE" "$AEROSPACE_DEST"

log "INFO" "Aerospace setup completed successfully."

