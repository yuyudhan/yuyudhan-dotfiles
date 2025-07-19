# FilePath: zsh/configs/07-file-management.zsh

# File and Directory Management
alias ll='ls -la'                    # Detailed file listing
alias la='ls -A'                     # List all files except . and ..
alias l='ls -CF'                     # Compact file listing
alias lsa='ls -lah'                  # List all files with detailed view
alias cls='clear'                    # Clear terminal
alias md='mkdir -p'                  # Create directory with parents
alias rd='rmdir'                     # Remove directory

# Enhanced file listing using eza (with fast fallback)
if [[ -x "/opt/homebrew/bin/eza" ]] || [[ -x "/usr/local/bin/eza" ]] || [[ -x "$HOME/.local/bin/eza" ]]; then
    alias ls="eza --icons"
    alias ll="eza --icons -lh"
else
    # Fallback to regular ls if eza not available
    alias ll='ls -la'
fi

# Better cat with fast fallback
if [[ -x "/opt/homebrew/bin/bat" ]] || [[ -x "/usr/local/bin/bat" ]] || [[ -x "$HOME/.local/bin/bat" ]]; then
    alias cat='bat'
fi

# Use nvim instead of vim
alias vim='nvim'