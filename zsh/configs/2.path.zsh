# zsh/zsh/path.zsh

# Core paths
# Check and add Homebrew paths
if [ -d "/opt/homebrew/bin" ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if [ -d "/usr/local/bin" ]; then
  export PATH="/usr/local/bin:$PATH"
fi
if [ -d "/usr/bin" ]; then
  export PATH="/usr/bin:$PATH"
fi
if [ -d "/bin" ]; then
  export PATH="/bin:$PATH"
fi
if [ -d "/usr/sbin" ]; then
  export PATH="/usr/sbin:$PATH"
fi
if [ -d "/sbin" ]; then
  export PATH="/sbin:$PATH"
fi

# Go bin directory
if [ -d "$HOME/go/bin" ]; then
  export PATH="$PATH:$HOME/go/bin"
fi

# User-defined paths
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi
if [ -d "/usr/local/sbin" ]; then
  export PATH="/usr/local/sbin:$PATH"
fi

