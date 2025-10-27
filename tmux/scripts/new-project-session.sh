#!/usr/bin/env bash
# FilePath: tmux/scripts/new-project-session.sh
# Create a new tmux session from a project directory

set -e

# Find directories in ~/code up to 3 levels deep
# You can adjust the path and depth as needed
if command -v fd &> /dev/null; then
    selected=$(fd -t d . ~/code --max-depth 3 2>/dev/null | fzf --reverse --prompt="Select project directory: " --height=50% --border)
elif command -v find &> /dev/null; then
    selected=$(find ~/code -maxdepth 3 -type d 2>/dev/null | fzf --reverse --prompt="Select project directory: " --height=50% --border)
else
    echo "Error: Neither fd nor find command found"
    exit 1
fi

# Exit if nothing selected
[[ -z $selected ]] && exit 0

# Create session name from directory basename, replacing dots with underscores
session_name=$(basename "$selected" | tr . _ | tr ' ' _)

# Check if session already exists
if tmux has-session -t="$session_name" 2>/dev/null; then
    # Session exists, just switch to it
    if [[ -z $TMUX ]]; then
        tmux attach-session -t "$session_name"
    else
        tmux switch-client -t "$session_name"
    fi
else
    # Create new session with 3 windows
    if [[ -z $TMUX ]]; then
        # Not in tmux, create and attach
        tmux new-session -ds "$session_name" -c "$selected" -n "editor" \; \
          send-keys "nvim" C-m \; \
          new-window -t "$session_name:2" -n "terminal" -c "$selected" \; \
          new-window -t "$session_name:3" -n "git" -c "$selected" \; \
          send-keys "git status" C-m \; \
          select-window -t "$session_name:1" \; \
          attach-session -t "$session_name"
    else
        # In tmux, create and switch
        tmux new-session -ds "$session_name" -c "$selected" -n "editor" \; \
          send-keys "nvim" C-m \; \
          new-window -t "$session_name:2" -n "terminal" -c "$selected" \; \
          new-window -t "$session_name:3" -n "git" -c "$selected" \; \
          send-keys "git status" C-m \; \
          select-window -t "$session_name:1" \; \
          switch-client -t "$session_name"
    fi
fi
