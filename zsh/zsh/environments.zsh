# zsh/zsh/environment.zsh

# General environment variables
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export EDITOR="nvim"                         # Set default editor to Neovim
export VISUAL="nvim"                         # Set default visual editor to Neovim

# macOS-specific environment variables
export HOMEBREW_NO_AUTO_UPDATE=1             # Disable Homebrew auto-update
export LANG="en_US.UTF-8"                    # Set language and locale
export LC_ALL="en_US.UTF-8"

# Python and Ruby paths (if using Homebrew-installed versions)
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Java setup (if using Homebrew-installed versions)
export JAVA_HOME="/usr/libexec/java_home -v 17"

# Node.js and npm (if using nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# History control
HISTSIZE=5000                                 # Number of history entries in memory
SAVEHIST=5000                                 # Number of history entries saved to file
HISTFILE="$HOME/.local/share/zsh/history"    # Location of history file

# Performance tuning
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bold"  # Autosuggestions style

