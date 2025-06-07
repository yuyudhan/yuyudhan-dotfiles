# FilePath: zsh/configs/10.custom-behaviour.zsh

# Add blank line before command output
preexec() {
    echo
}

# Add blank line after command completes
precmd() {
    echo
}

