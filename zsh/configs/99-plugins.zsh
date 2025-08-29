# FilePath: zsh/configs/99-plugins.zsh

# -------------------------------------------------------------------
# Plugin Manager: Zinit (https://github.com/zdharma-continuum/zinit)
# -------------------------------------------------------------------

# Fast Zinit loading - assume it's installed
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
source "$ZINIT_HOME/zinit.git/zinit.zsh"

# Essential plugins only - optimized for speed
# Commented out for performance optimization
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-syntax-highlighting

# Load Powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# -------------------------------------------------------------------
# Additional Configurations
# -------------------------------------------------------------------

# Note: Plugins are commented out for performance optimization

