#!/bin/bash
# FilePath: tmux/scripts/create-equal-panes.sh
# Creates N equally-spaced horizontal panes in the current tmux window
# Usage: create-equal-panes.sh <number_of_panes>

# Get the number of panes to create
NUM_PANES=$1

# Validate input
if [[ ! "$NUM_PANES" =~ ^[2-5]$ ]]; then
    tmux display-message "Error: Number of panes must be between 2 and 5"
    exit 1
fi

# Kill all panes except the first one (pane 0)
# Kill in reverse order to avoid index shifting issues
for pane in $(tmux list-panes -F "#{pane_index}" | tail -n +2 | sort -rn); do
    tmux kill-pane -t "$pane"
done

# Create (NUM_PANES - 1) new panes with vertical splits
for ((i=1; i<NUM_PANES; i++)); do
    tmux split-window -h -c "#{pane_current_path}"
done

# Apply even-horizontal layout to make all panes equal width
tmux select-layout even-horizontal

# Display success message
tmux display-message "Created $NUM_PANES equal panes"
