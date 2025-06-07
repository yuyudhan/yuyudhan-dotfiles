# FilePath: install.sh
# In this file we install all the basic things that are required to be
# productive in mac. This is my personal configuration.

#!/bin/bash

set -e # Exit on any error

echo "🚀 Starting Mac Development Environment Setup..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
	echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
	echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
	echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
	echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
	print_error "This script is designed for macOS only!"
	exit 1
fi

# Install Xcode Command Line Tools
print_status "Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
	xcode-select --install
	print_warning "Please complete Xcode Command Line Tools installation and re-run this script"
	exit 1
else
	print_success "Xcode Command Line Tools already installed"
fi

# Install Homebrew
print_status "Installing Homebrew..."
if ! command -v brew &>/dev/null; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Add Homebrew to PATH for Apple Silicon Macs
	if [[ $(uname -m) == "arm64" ]]; then
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo 'eval "$(/usr/local/bin/brew shellenv)"' >>~/.zprofile
		eval "$(/usr/local/bin/brew shellenv)"
	fi

	print_success "Homebrew installed successfully"
else
	print_success "Homebrew already installed"
	brew update
fi

# Install Zsh (usually pre-installed on macOS, but ensuring latest version)
print_status "Installing Zsh..."
brew install zsh
print_success "Zsh installed"

# Install Oh My Zsh
print_status "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
	print_success "Oh My Zsh installed"
else
	print_success "Oh My Zsh already installed"
fi

# Set Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
	print_status "Setting Zsh as default shell..."
	chsh -s $(which zsh)
	print_success "Default shell changed to Zsh"
fi

# Install development tools via Homebrew
print_status "Installing development tools via Homebrew..."

brew_packages=(
	"thefuck"
	"thefuck"
	"zoxide"
	"eza"
	"bat"
	"tree"
	"go"
	"fzf"
	"lazygit"
	"ffmpeg"
	"python@3.9"
	"python@3.10"
	"python@3.12"
	"czkawka"
	"neovim"
	"tmux"
	"tokei"
	"tree-sitter"
	"glib"
	"just"
	"node"
	"rust"
	"ripgrep"
	"fd"
	"htop"
	"jq"
	"yq"
	"git"
	"curl"
	"wget"
)

for package in "${brew_packages[@]}"; do
	print_status "Installing $package..."
	brew install "$package" || print_warning "Failed to install $package"
done

print_success "All Homebrew packages installed"

# Install GUI applications via Homebrew Cask
print_status "Installing GUI applications..."

cask_packages=(
	"homerow"
	"aerospace"
	"karabiner-elements"
	"orbstack"
	"visual-studio-code"
	"postman"
	"docker"
	"iterm2"
	"sublime-text"
)

for cask in "${cask_packages[@]}"; do
	print_status "Installing $cask..."
	brew install --cask "$cask" || print_warning "Failed to install $cask"
done

print_success "GUI applications installed"

# Configure fzf
print_status "Configuring fzf..."
$(brew --prefix)/opt/fzf/install --all --no-bash --no-fish
print_success "fzf configured"

# Install LazyVim
print_status "Installing LazyVim..."
if [ ! -d "$HOME/.config/nvim" ]; then
	git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
	rm -rf "$HOME/.config/nvim/.git"
	print_success "LazyVim installed"
else
	print_warning "Neovim config already exists, skipping LazyVim installation"
fi

# Install Node.js packages globally
print_status "Installing global Node.js packages..."
npm_packages=(
	"typescript"
	"typescript-language-server"
	"eslint"
	"prettier"
	"@typescript-eslint/parser"
	"@typescript-eslint/eslint-plugin"
	"eslint-plugin-react"
	"eslint-plugin-react-hooks"
)

for package in "${npm_packages[@]}"; do
	print_status "Installing $package..."
	npm install -g "$package" || print_warning "Failed to install $package"
done

# Install Python packages
print_status "Installing Python packages..."
python3 -m pip install --user ruff black isort mypy basedpyright

# Install Go tools
print_status "Installing Go tools..."
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/cmd/goimports@latest

# Install Rust components
print_status "Installing Rust components..."
rustup component add rust-analyzer rustfmt clippy

# Wait for Neovim to be ready and install Mason packages
print_status "Installing Neovim Mason packages..."
sleep 2 # Give time for any background processes

# Create Mason install command
mason_packages=(
	"typescript-language-server"
	"eslint-lsp"
	"gopls"
	"rust-analyzer"
	"basedpyright"
	"html-lsp"
	"css-lsp"
	"tailwindcss-language-server"
	"json-lsp"
	"yaml-language-server"
	"dockerfile-language-server"
	"docker-compose-language-service"
	"marksman"
	"lua-language-server"
	"prettier"
	"prettierd"
	"gofumpt"
	"goimports"
	"ruff"
	"stylua"
	"shfmt"
	"mdformat"
	"golangci-lint"
	"golangci-lint-langserver"
	"hadolint"
	"shellcheck"
	"js-debug-adapter"
	"go-debug-adapter"
	"clangd"
	"clang-format"
	"cpptools"
	"codelldb"
	"ansible-language-server"
	"ansible-lint"
	"lemminx"
	"yamlfix"
	"yamlfmt"
	"yamllint"
	"terraform-ls"
	"tflint"
	"tfsec"
	"systemd-language-server"
	"sqlls"
	"sql-formatter"
	"sqlfluff"
	"pgformatter"
	"intelephense"
	"php-cs-fixer"
	"phpactor"
	"phpcs"
	"jdtls"
	"java-debug-adapter"
	"bash-language-server"
	"beautysh"
	"gitlint"
	"checkmake"
	"cmake-language-server"
	"cmakelang"
	"taplo"
)

# Join array elements with space
mason_install_cmd=$(
	IFS=' '
	echo "${mason_packages[*]}"
)

# Install Mason packages
nvim --headless -c "MasonInstall $mason_install_cmd" -c "qa" 2>/dev/null || {
	print_warning "Mason packages installation failed. You can install them manually later with:"
	echo ":MasonInstall $mason_install_cmd"
}

# Configure Zsh with useful aliases and settings
print_status "Configuring Zsh..."
cat >>"$HOME/.zshrc" <<'EOF'

# Custom aliases
alias ls='eza --color=always --group-directories-first'
alias ll='eza -la --color=always --group-directories-first'
alias la='eza -a --color=always --group-directories-first'
alias lt='eza -aT --color=always --group-directories-first'
alias cat='bat --style=numbers --color=always'
alias grep='rg'
alias find='fd'
alias tmux='tmux -f ~/.config/tmux/tmux.conf'

# Git aliases
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'
alias lg='lazygit'

# Initialize tools
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path additions
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

EOF

print_success "Zsh configuration updated"

# Create tmux config directory
print_status "Setting up tmux configuration..."
mkdir -p "$HOME/.config/tmux"

# Install tmux plugin manager
if [ ! -d "$HOME/.config/tmux/plugins/tpm" ]; then
	git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
	print_success "Tmux Plugin Manager installed"
fi

# Final message
print_success "🎉 Mac development environment setup completed!"
echo
print_status "Next steps:"
echo "1. Restart your terminal or run: source ~/.zshrc"
echo "2. Open Neovim and let LazyVim install plugins"
echo "3. Configure your dotfiles and personal settings"
echo "4. In tmux, press prefix + I to install tmux plugins"
echo
print_warning "Note: Some applications may require manual configuration"
print_success "Happy coding! 🚀"

# Add the cargo installations of
# carbo install cargo-binstall
# cargo binstall choose
# cargo binstall du-dust
# carbo ginstall rm-improved
# cargo binstall procs

