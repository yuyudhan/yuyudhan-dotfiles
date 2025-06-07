#!/bin/bash
set -e

# If the first argument is "zsh", perform Zsh setup and exit.
if [[ "$1" == "zsh" ]]; then
	CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
	ZSH_DIR="$CURRENT_DIR/zsh"
	OH_MY_ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	mkdir -p "$OH_MY_ZSH_CUSTOM"

	create_symlink() {
		local source_file=$1
		local target_file=$2
		if [ -e "$target_file" ] || [ -L "$target_file" ]; then
			rm -f "$target_file"
			echo "Removed existing file/symlink: $target_file"
		fi
		ln -s "$source_file" "$target_file"
		echo "Created symlink: $target_file -> $source_file"

	}
	for file in "$ZSH_DIR/configs"/*; do
		[ -f "$file" ] || continue
		create_symlink "$file" "$OH_MY_ZSH_CUSTOM/$(basename "$file")"
	done

	for file in "$ZSH_DIR"/*.zsh; do
		[ -f "$file" ] || continue
		create_symlink "$file" "$OH_MY_ZSH_CUSTOM/$(basename "$file")"
	done

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

# Function to create a symlink interactively.
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

	echo -n "Do you want to create a symlink for $target? [y/N] "
	read -r install_confirm </dev/tty

	if [[ "$install_confirm" != "y" && "$install_confirm" != "Y" ]]; then
		echo "❌ Skipping symlink creation for $target."
		return
	fi

	if [ -L "$target" ]; then
		echo -n "Symlink already exists for $target. Delete it? [y/N] "
		read -r delete_confirm </dev/tty
		if [[ "$delete_confirm" == "y" || "$delete_confirm" == "Y" ]]; then
			rm -f "$target"
			echo "🗑️  Deleted existing symlink for $target."
		else
			echo "⚠️  Skipping $target."
			return
		fi
	elif [ -e "$target" ]; then
		echo -n "File or directory exists at $target. Delete it? [y/N] "
		read -r delete_confirm </dev/tty
		if [[ "$delete_confirm" == "y" || "$delete_confirm" == "Y" ]]; then
			rm -rf "$target"
			echo "🗑️  Deleted existing file or directory at $target."
		else
			echo "⚠️  Skipping $target."
			return
		fi
	fi

	ln -s "$source" "$target"
	echo "✅ Created symlink: $target → $source"
}

# List of symlink mappings (source target).
SYMLINKS="
nvim $HOME/.config/nvim
vimrc $HOME/.vimrc
vim $HOME/.config/vim
wezterm $HOME/.config/wezterm
aerospace $HOME/.config/aerospace
tmux $HOME/.config/tmux
yazi $HOME/.config/yazi
hammerspoon $HOME/.hammerspoon
sketchybar $HOME/.config/sketchybar
karabiner $HOME/.config/karabiner
btop $HOME/.config/btop
obsidian $HOME/.config/obsidian
alacritty $HOME/.config/alacritty
zellij $HOME/.config/zellij
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

	echo "$SYMLINKS" | while read -r item target; do
		[ -z "$item" ] && continue
		if [[ "$item" == "$key" ]]; then
			source="$DOTFILES_DIR/$item"
			create_symlink "$source" "$target"
			found=true
			break
		fi
	done

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

