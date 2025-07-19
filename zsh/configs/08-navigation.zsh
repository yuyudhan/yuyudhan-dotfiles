# FilePath: zsh/configs/08-navigation.zsh

# Navigation (Enhanced with zoxide)

# Navigation (lazy load zoxide for better performance)

# Check if zoxide is available (fast path check)
if [[ -x "/opt/homebrew/bin/zoxide" ]] || [[ -x "/usr/local/bin/zoxide" ]] || [[ -x "$HOME/.local/bin/zoxide" ]]; then
  # Lazy initialization of zoxide
  __zoxide_z() {
    if [[ -z "$__ZOXIDE_INITIALIZED" ]]; then
      eval "$(zoxide init zsh)"
      export __ZOXIDE_INITIALIZED=1
    fi
    z "$@"
  }

  alias cd='__zoxide_z'
  alias z='__zoxide_z'
  alias ..='__zoxide_z ..'
  alias ...='__zoxide_z ../..'
  alias ~='__zoxide_z ~'

  # Lazy load other zoxide commands
  zi() {
    if [[ -z "$__ZOXIDE_INITIALIZED" ]]; then
      eval "$(zoxide init zsh)"
      export __ZOXIDE_INITIALIZED=1
    fi
    zoxide query -i "$@"
  }

else
  # Default navigation aliases if zoxide isn't installed
  alias ..='cd ..'
  alias ...='cd ../..'
  alias ~='cd ~'
  alias fcd='cd "$(find . -type d | fzf)"'
fi

