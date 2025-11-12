# File: ~/.config/zsh/configs/12-tmux-titles.zsh
# Tmux terminal title integration with automatic SSH detection

# Only run in tmux sessions
if [[ -n "$TMUX" ]]; then

    # Function to set terminal title
    function set_tmux_title() {
        local title="$1"
        # Set terminal title (captured by tmux as pane_title)
        print -Pn "\e]2;${title}\e\\"
    }

    # Function to detect SSH session and format title
    function get_session_title() {
        # Check if we're in an SSH session
        if [[ -n "$SSH_CONNECTION" ]] || [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
            # SSH session - show user@host
            echo "${USER}@${HOST}"
        else
            # Local session - show current directory basename
            echo "$(basename "$PWD")"
        fi
    }

    # precmd: runs before each prompt
    function tmux_title_precmd() {
        set_tmux_title "$(get_session_title)"
    }

    # preexec: runs before each command
    function tmux_title_preexec() {
        local cmd="${1[(wr)^(*=*|sudo|ssh|mosh|kubectl|docker)]}"
        local session_info="$(get_session_title)"

        # Special handling for ssh/mosh commands
        if [[ "$1" =~ ^(ssh|mosh) ]]; then
            # Extract destination from ssh/mosh command
            local dest=$(echo "$1" | grep -oE '([a-zA-Z0-9_-]+@)?[a-zA-Z0-9._-]+' | tail -1)
            set_tmux_title "→ $dest"
        else
            # Show command being run
            set_tmux_title "$session_info: $cmd"
        fi
    }

    # Add hooks
    autoload -Uz add-zsh-hook
    add-zsh-hook precmd tmux_title_precmd
    add-zsh-hook preexec tmux_title_preexec

    # Set initial title
    set_tmux_title "$(get_session_title)"
fi
