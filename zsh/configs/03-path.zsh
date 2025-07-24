# FilePath: zsh/configs/03-path.zsh

# Base system paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Homebrew paths (highest priority for package management)
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d "/usr/local/sbin" ]; then
    export PATH="/usr/local/sbin:$PATH"
fi

# User-defined paths (high priority for custom tools)
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi