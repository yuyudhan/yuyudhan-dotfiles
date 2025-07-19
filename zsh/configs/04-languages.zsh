# FilePath: zsh/configs/04-languages.zsh

# Python paths (if using Homebrew-installed versions)
export PATH="/opt/homebrew/opt/python@3.11/bin:$PATH"

# Ruby paths (if using Homebrew-installed versions)
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Java setup (lazy load for better performance)
java() {
    if [[ -z "$JAVA_HOME" ]]; then
        export JAVA_HOME="$(/usr/libexec/java_home -v 17 2>/dev/null)"
    fi
    command java "$@"
}

javac() {
    if [[ -z "$JAVA_HOME" ]]; then
        export JAVA_HOME="$(/usr/libexec/java_home -v 17 2>/dev/null)"
    fi
    command javac "$@"
}

# Go paths
if [ -d "$HOME/go/bin" ]; then
    export PATH="$PATH:$HOME/go/bin"
fi

# Node.js and npm (lazy load nvm for better performance)
export NVM_DIR="$HOME/.nvm"

# Lazy load nvm to improve shell startup time
nvm() {
    unset -f nvm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    nvm "$@"
}

# Lazy load npm
npm() {
    unset -f npm
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    npm "$@"
}

# Lazy load node
node() {
    unset -f node
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    node "$@"
}

