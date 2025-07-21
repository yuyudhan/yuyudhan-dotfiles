# FilePath: zsh/configs/08-navigation.zsh

# Navigation (optimized for speed)

# Simple navigation aliases - no binary checks
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias fcd='cd "$(find . -type d | fzf)"'

# Optional zoxide integration (manual setup)
# Uncomment if you want zoxide and have it installed:
# eval "$(zoxide init zsh)"

