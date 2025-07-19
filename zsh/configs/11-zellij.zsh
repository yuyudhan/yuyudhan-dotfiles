# FilePath: zsh/configs/11-zellij.zsh

# Zellij Aliases (Prefixed with zl-)

# Zellij session management
alias zl-list='zellij list-sessions'                  # List all Zellij sessions
alias zl-kill='zellij kill-session -s'               # Kill a specific Zellij session
alias zl-attach='zellij attach '                   # Attach to a specific Zellij session
alias zl-new='zellij -s'                             # Create a new Zellij session

# Zellij tab (window) management
alias zl-tabs='zellij action go-to-tab-name'         # List all tabs (manual step, no direct command)
alias zl-new-tab='zellij action new-tab'            # Create a new tab
alias zl-close-tab='zellij action close-tab'        # Close the current tab
alias zl-rename-tab='zellij action rename-tab'      # Rename the current tab

# Zellij pane management
alias zl-split-v='zellij action new-pane split-down'  # Split the current pane vertically
alias zl-split-h='zellij action new-pane split-right' # Split the current pane horizontally
alias zl-close-pane='zellij action close-pane'        # Close the current pane
alias zl-focus='zellij action toggle-focus'           # Toggle focus between panes

# Quick session/server management
alias zl-kill-all='zellij kill-all-sessions'          # Kill all Zellij sessions
alias zl-detach='zellij detach'                       # Detach from the current session
alias zl-reload='zellij setup --clean --generate-completion'  # Reload Zellij configuration

