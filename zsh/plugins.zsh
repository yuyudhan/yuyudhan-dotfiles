#  FilePath: zsh/plugins.zsh

# -------------------------------------------------------------------
# Plugin Manager: Zinit (https://github.com/zdharma-continuum/zinit)
# -------------------------------------------------------------------

# Load Zinit if not already installed
if [[ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin/zinit.zsh" ]]; then
    echo "Installing Zinit plugin manager..."
    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/zinit" && \
        git clone https://github.com/zdharma-continuum/zinit.git "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin"
fi

# Source Zinit only if it exists
if [[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin/zinit.zsh" ]]; then
    source "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin/zinit.zsh"
else
    echo "Error: Zinit could not be loaded. Please check your installation."
fi

# -------------------------------------------------------------------
# Plugins and Enhancements
# -------------------------------------------------------------------

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Powerlevel10k prompt
zinit light romkatv/powerlevel10k

# Vim-tmux navigator integration
zinit light christoomey/vim-tmux-navigator

# -------------------------------------------------------------------
# Additional Configurations
# -------------------------------------------------------------------

# Note: Syntax highlighting is already loaded above - no need to load twice

