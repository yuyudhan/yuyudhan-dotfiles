# zsh/zsh/plugins.zsh

# Enable Zsh plugins and enhancements

# Autosuggestions (https://github.com/zsh-users/zsh-autosuggestions)
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Powerlevel10k prompt (https://github.com/romkatv/powerlevel10k)
if [ -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
fi

# Vim-tmux navigator integration
if [ -f "/opt/homebrew/share/vim-tmux-navigator/tmux-navigator.zsh" ]; then
  source "/opt/homebrew/share/vim-tmux-navigator/tmux-navigator.zsh"
fi

