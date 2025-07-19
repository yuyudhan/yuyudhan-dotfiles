# FilePath: zsh/configs/97-profiling-end.zsh

# End profiling and show results

# Show startup time if profiling enabled
if [[ -n "$ZSH_PROFILE" ]]; then
    local end_time=$(date +%s.%N)
    local startup_time=$(echo "$end_time - $ZSH_STARTUP_TIME" | bc -l 2>/dev/null || echo "N/A")
    echo "⚡ Total startup time: ${startup_time}s"
    echo ""
    echo "📊 Detailed profiling results:"
    zprof
fi

# Performance debugging aliases
alias zsh-profile='ZSH_PROFILE=1 zsh'
alias zsh-time='time zsh -i -c exit'
alias zsh-debug='zsh -x'

# Network debugging (for slow DNS/network issues)
alias check-dns='dig google.com | grep "Query time"'
alias check-network='ping -c 1 google.com'