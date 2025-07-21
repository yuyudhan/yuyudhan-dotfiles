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

