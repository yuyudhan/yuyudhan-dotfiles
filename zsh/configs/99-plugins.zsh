#  FilePath: zsh/plugins.zsh

# -------------------------------------------------------------------
# Plugin Manager: Zinit (https://github.com/zdharma-continuum/zinit)
# -------------------------------------------------------------------

# Fast Zinit loading - assume it's installed
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
source "$ZINIT_HOME/bin/zinit.zsh"

# Essential plugins only - optimized for speed
zinit light zsh-users/zsh-autosuggestions
# Removed for performance - was taking 22.97% of startup time
# zinit light zsh-users/zsh-syntax-highlighting

# -------------------------------------------------------------------
# Additional Configurations
# -------------------------------------------------------------------

# Note: Syntax highlighting is already loaded above - no need to load twice

