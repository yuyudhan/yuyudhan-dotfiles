# FilePath: zsh/configs/01-core.zsh

# Core zsh settings and options
setopt autocd              # Automatically cd into directories
setopt hist_ignore_dups    # Ignore duplicate history entries
setopt hist_ignore_space   # Ignore commands starting with space in history
setopt interactivecomments # Allow comments in interactive mode
setopt prompt_subst        # Enable command substitution in prompts
setopt share_history       # Share history across terminals

# History configuration
HISTSIZE=5000                                 # Number of history entries in memory
SAVEHIST=5000                                 # Number of history entries saved to file
HISTFILE="$HOME/.local/share/zsh/history"    # Location of history file