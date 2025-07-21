# FilePath: zsh/configs/04-languages.zsh

# Python paths (if using Homebrew-installed versions)
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"

# Ruby paths (if using Homebrew-installed versions)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Language paths (optimized for speed)

# Go paths
if [ -d "$HOME/go/bin" ]; then
    export PATH="$PATH:$HOME/go/bin"
fi

# Minimal environment setup - avoid expensive operations
# Manual setup required for specific tools:
# For Java: export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
# For NVM: source "/opt/homebrew/opt/nvm/nvm.sh"

