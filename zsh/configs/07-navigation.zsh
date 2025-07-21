# FilePath: zsh/configs/08-navigation.zsh

# Navigation (optimized for speed)

# Simple navigation aliases - no binary checks
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias fcd='cd "$(find . -type d | fzf)"'

# Lazy load zoxide
z() {
    unfunction z
    eval "$(zoxide init zsh)"
    z "$@"
}

