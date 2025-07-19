# FilePath: zsh/configs/06-utilities.zsh

# Utility aliases
alias clearscroll='printf "\033c"'
alias reloadshell='exec $SHELL -l'   # Reload the shell
alias path='echo -e ${PATH//:/\\n}'  # Display PATH in a readable format
alias mkcd='foo(){ mkdir -p "$1"; cd "$1"; }; foo'  # Create and navigate to a directory
alias histg='history | grep'         # Search command history

# Search and Text Processing (consolidated for performance)
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'

