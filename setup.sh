#!/bin/bash
set -e

# If the first argument is "zsh", perform Zsh setup and exit.
if [[ "$1" == "zsh" ]]; then
	CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
	ZSH_DIR="$CURRENT_DIR/zsh"

	create_symlink() {
		local source_file=$1
		local target_file=$2
		if [ -e "$target_file" ] || [ -L "$target_file" ]; then
			rm -rf "$target_file"
			echo "Removed existing file/symlink: $target_file"
		fi
		ln -s "$source_file" "$target_file"
		echo "Created symlink: $target_file -> $source_file"
	}

	# Install Zinit if not already installed
	if [ ! -d "$HOME/.local/share/zinit/zinit.git" ]; then
		echo "Installing Zinit..."
		bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
		echo "✅ Zinit installed"
	else
		echo "✅ Zinit already installed"
	fi

	# Symlink zshrc to ~/.zshrc
	create_symlink "$ZSH_DIR/zshrc" "$HOME/.zshrc"

	# Symlink entire zsh directory to ~/.config/zsh
	create_symlink "$ZSH_DIR" "$HOME/.config/zsh"

	echo "✅ Zsh setup complete!"
	exit 0
fi

# Ensure the script is run with Bash.
if [ -z "$BASH_VERSION" ]; then
	echo "❗ This script must be run using bash. Use: bash $0"
	exit 1
fi

# Base directory for your dotfiles.
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# Function to create a symlink automatically.
create_symlink() {
	source=$1
	target=$2

	echo "Processing symlink:"
	echo "  Source: $source"
	echo "  Target: $target"

	if [ ! -e "$source" ]; then
		echo "❌ Source does not exist at: $source"
		return
	fi

	# Remove existing file, directory, or symlink
	if [ -e "$target" ] || [ -L "$target" ]; then
		rm -rf "$target"
		echo "🗑️  Removed existing file/directory/symlink: $target"
	fi

	# Create parent directory if it doesn't exist
	mkdir -p "$(dirname "$target")"

	ln -s "$source" "$target"
	echo "✅ Created symlink: $target → $source"
}

# List of symlink mappings (source target).
SYMLINKS="
nvim $HOME/.config/nvim
wezterm $HOME/.config/wezterm
aerospace $HOME/.config/aerospace
tmux $HOME/.config/tmux
yazi $HOME/.config/yazi
karabiner $HOME/.config/karabiner
btop $HOME/.config/btop
"

# Function to process all symlinks.
setup_all_symlinks() {
	echo "🔧 Setting up all symlinks..."
	echo "$SYMLINKS" | while read -r key target; do
		[ -z "$key" ] && continue
		source="$DOTFILES_DIR/$key"
		create_symlink "$source" "$target"
	done
}

# Function to process a single symlink.
setup_single_symlink() {
	key=$1
	found=false

	while read -r item target; do
		[ -z "$item" ] && continue
		if [[ "$item" == "$key" ]]; then
			source="$DOTFILES_DIR/$item"
			create_symlink "$source" "$target"
			found=true
			break
		fi
	done <<<"$SYMLINKS"

	if [ "$found" = false ]; then
		echo "❗ Invalid option: $key"
		echo "Available options: $(echo "$SYMLINKS" | cut -d' ' -f1 | xargs)"
		exit 1
	fi
}

# Main logic: if an argument is provided, process it as a single symlink; otherwise, process all.
if [ -n "$1" ]; then
	setup_single_symlink "$1"
else
	setup_all_symlinks
fi

echo "🎉 All requested symlinks have been created or updated."

