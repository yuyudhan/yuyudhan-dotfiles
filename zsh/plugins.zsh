# zsh/zsh/plugins.zsh

# -------------------------------------------------------------------
# Plugin Manager: Zinit (https://github.com/zdharma-continuum/zinit)
# -------------------------------------------------------------------

# Load Zinit if not already installed
if [[ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.zsh" ]]; then
  echo "Installing Zinit plugin manager..."
  mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/zinit" && \
  git clone https://github.com/zdharma-continuum/zinit.git "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin"
fi
source "${XDG_DATA_HOME:-$HOME/.local/share}/zinit/bin/zinit.zsh"

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

# Zsh vi-mode for enhanced Vim-like behavior
zinit light jeffreytse/zsh-vi-mode


# -------------------------------------------------------------------
# Additional Configurations
# -------------------------------------------------------------------

# Enable Vi-mode in Zsh
bindkey -v

# Enable clipboard copy/paste in visual mode
bindkey -M vicmd 'y' copy-selection-and-send-to-clipboard # Copy selection
bindkey -M vicmd 'p' bracketed-paste                     # Paste content

# Make sure syntax highlighting loads after other plugins
zinit light zsh-users/zsh-syntax-highlighting

