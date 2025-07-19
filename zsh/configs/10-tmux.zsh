# FilePath: zsh/configs/10-tmux.zsh

# Tmux Aliases
# alias tmux='tmux -f ~/.config/tmux/tmux.conf'

# Tmux session management
alias tmuxlist='tmux list-sessions'                  # List all Tmux sessions
alias tmuxkill='tmux kill-session -t'                # Kill a specific Tmux session
alias tmuxattach='tmux attach-session -t'            # Attach to a specific Tmux session
alias tmuxnew='tmux new-session -s'                  # Create a new Tmux session

# Tmux window management
alias tmuxlist-windows='tmux list-windows'           # List windows in the current session
alias tmuxkill-window='tmux kill-window -t'          # Kill a specific Tmux window

# Tmux pane management
alias tmuxsplit-v='tmux split-window -v'             # Split the current pane vertically
alias tmuxsplit-h='tmux split-window -h'             # Split the current pane horizontally
alias tmuxrename-window='tmux rename-window'         # Rename the current window

# Quick session/server management
alias tmuxkill-all='tmux kill-server'                # Kill all Tmux sessions
alias tmuxdetach='tmux detach'                       # Detach from the current session

