# FilePath: zsh/configs/15-misc.zsh

# Miscellaneous Aliases and Functions

# Print all files in project with filtering
alias printfiles='find . \
    -type d \( \
    -name .git -o \
    -name node_modules -o \
    -name dist -o \
    -name build -o \
    -name .cache -o \
    -name tmp \
    \) -prune -o \
    -type f \( \
    -name "*.swp" -o \
    -name "*.log" -o \
    -name "*.tmp" -o \
    -name "package-lock.json" -o \
    -name "*.bak" -o \
    -name "*.DS_Store" -o \
    -name "*.pyc" -o \
    -name "*.class" \
    \) -prune -o \
    -exec sh -c '\''echo "=== {} ==="; cat "{}"'\'' \;'