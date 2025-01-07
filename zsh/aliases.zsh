# zsh/zsh/aliases.zsh

# -------------------------------------------------------------------
# File and Directory Management
# -------------------------------------------------------------------

alias ll='ls -la'                    # Detailed file listing
alias la='ls -A'                     # List all files except . and ..
alias l='ls -CF'                     # Compact file listing
alias lsa='ls -lah'                  # List all files with detailed view
alias cls='clear'                    # Clear terminal
alias md='mkdir -p'                  # Create directory with parents
alias rd='rmdir'                     # Remove directory

# Enhanced file listing using exa
alias ls="eza --icons"
alias ll="eza --icons -lh"

# Compact and human-readable file sizes
alias cat='bat'

# Use nvim instead of vim.
# alias vim='nvim'

# -------------------------------------------------------------------
# Tmux Aliases
# -------------------------------------------------------------------
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

# -------------------------------------------------------------------
# Navigation
# -------------------------------------------------------------------

alias ..='cd ..'                     # Go up one directory
alias ...='cd ../..'                 # Go up two directories
alias ~='cd ~'                       # Shortcut to home directory
alias fcd='cd "$(find . -type d | fzf)"' # Fuzzy directory navigation

# -------------------------------------------------------------------
# System Management
# -------------------------------------------------------------------

alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias volup='osascript -e "set volume output volume (output volume of (get volume settings) + 10) --100%"'
alias voldown='osascript -e "set volume output volume (output volume of (get volume settings) - 10) --100%"'
alias update='brew update && brew upgrade && brew cleanup'

# Network management
alias ip='ipconfig getifaddr en0'    # Get local IP address
alias publicip='curl -s ifconfig.me' # Get public IP address

# -------------------------------------------------------------------
# Git Aliases
# -------------------------------------------------------------------

alias gbr='git branch remote'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git branch'

# -------------------------------------------------------------------
# Docker Aliases
# -------------------------------------------------------------------

alias dc='docker compose'
alias docker-stop-all-containers="docker stop $(docker ps -aq)" # Stop all containers
alias docker-rm-all-containers='docker rm $(docker ps -aq)'     # Remove all containers

# -------------------------------------------------------------------
# Search and Text Processing
# -------------------------------------------------------------------

alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'

# -------------------------------------------------------------------
# Miscellaneous Aliases
# -------------------------------------------------------------------

alias printfiles='find . \
    -type d \( \
    -name .git -o \
    -name node_modules -o \
    -name dist -o \
    -name build -o \
    -name .cache -o \
    -name tmp \
    \) -prune -o \
    -type f \( \
    -name "*.swp" -o \
    -name "*.log" -o \
    -name "*.tmp" -o \
    -name "package-lock.json" -o \
    -name "*.bak" -o \
    -name "*.DS_Store" -o \
    -name "*.pyc" -o \
    -name "*.class" \
    \) -prune -o \
    -exec sh -c '\''echo "=== {} ==="; cat "{}"'\'' \;'

# -------------------------------------------------------------------
# Path Management
# -------------------------------------------------------------------

export PATH="$PATH:/usr/local/go/bin"

