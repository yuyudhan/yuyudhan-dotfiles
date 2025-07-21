#  FilePath: zsh/plugins.zsh

# -------------------------------------------------------------------
# Plugin Manager: Zinit (https://github.com/zdharma-continuum/zinit)
# -------------------------------------------------------------------

# Fast Zinit loading - assume it's installed
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit"
source "$ZINIT_HOME/bin/zinit.zsh"

# Essential plugins only - optimized for speed
# Removed for performance - autosuggestions and syntax highlighting were slowing startup
# zinit light zsh-users/zsh-autosuggestions
# zinit light zsh-users/zsh-syntax-highlighting

# Load Powerlevel10k theme
zinit ice depth=1
zinit light romkatv/powerlevel10k

# -------------------------------------------------------------------
# Additional Configurations
# -------------------------------------------------------------------

# Note: Syntax highlighting is already loaded above - no need to load twice

