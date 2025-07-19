# FilePath: zsh/configs/00-profiling.zsh

# Performance profiling tools for debugging slow startup

# Enable profiling when ZSH_PROFILE is set
if [[ -n "$ZSH_PROFILE" ]]; then
    zmodload zsh/zprof
    echo "🔍 Zsh profiling enabled - startup analysis will show at the end"
fi

# Timestamp startup for basic timing
if [[ -z "$ZSH_STARTUP_TIME" ]]; then
    export ZSH_STARTUP_TIME=$(date +%s.%N)
fi