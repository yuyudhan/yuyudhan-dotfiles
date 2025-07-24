# FilePath: zsh/configs/07-file-management.zsh

# File and Directory Management
alias ll='ls -la'                    # Detailed file listing
alias la='ls -A'                     # List all files except . and ..
alias l='ls -CF'                     # Compact file listing
alias lsa='ls -lah'                  # List all files with detailed view
alias cls='clear'                    # Clear terminal
alias md='mkdir -p'                  # Create directory with parents
alias rd='rmdir'                     # Remove directory

# Optional enhanced tools (manual setup)
alias ls="eza --icons"
alias ll="eza --icons -lh"
alias cat='bat'

# Use nvim instead of vim
alias vim='nvim'

