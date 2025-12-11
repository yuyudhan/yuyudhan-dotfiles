#!/bin/bash
set -e

################################################################################
# Dotfiles Setup Script
# Manages symlinks for all configuration files
################################################################################

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Script state
DRY_RUN=false
FORCE_UPDATE=false
DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

# Counters for summary
CREATED_COUNT=0
SKIPPED_COUNT=0
ERROR_COUNT=0

################################################################################
# Helper Functions
################################################################################

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_header() {
    echo -e "\n${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
}

show_help() {
    cat <<EOF
${BLUE}Dotfiles Setup Script${NC}

${YELLOW}Usage:${NC}
  bash setup.sh [OPTIONS] [TOOL...]

${YELLOW}Options:${NC}
  -h, --help      Show this help message
  -d, --dry-run   Preview changes without making them
  -f, --force     Force recreate symlinks even if already correct
  -a, --all       Setup all tools (default if no tools specified)

${YELLOW}Tools:${NC}
  nvim            Neovim configuration
  wezterm         WezTerm terminal emulator
  aerospace       Aerospace window manager
  tmux            Tmux terminal multiplexer
  yazi            Yazi file manager
  karabiner       Karabiner keyboard customizer
  btop            Btop system monitor
  zsh             Zsh shell (special: creates ~/.zshrc + ~/.config/zsh/)
  claude          Claude Code (special: symlinks agents/commands/settings)
  opencode        OpenCode (special: symlinks commands to ~/.config/opencode/command/)

${YELLOW}Examples:${NC}
  bash setup.sh                    ${BLUE}# Setup all tools${NC}
  bash setup.sh nvim tmux          ${BLUE}# Setup only nvim and tmux${NC}
  bash setup.sh --dry-run zsh      ${BLUE}# Preview zsh setup${NC}
  bash setup.sh -d --all           ${BLUE}# Preview all setups${NC}
  bash setup.sh --force claude     ${BLUE}# Force recreate claude symlinks${NC}
  bash setup.sh opencode            ${BLUE}# Setup opencode commands${NC}

${YELLOW}Special Handlers:${NC}
  ${GREEN}zsh${NC}     - Creates both ~/.zshrc symlink and ~/.config/zsh/ directory symlink
  ${GREEN}claude${NC}  - Symlinks .claude/agents/, .claude/commands/, and .claude/settings.json
  ${GREEN}opencode${NC} - Symlinks commands to ~/.config/opencode/command/ for global access
  ${GREEN}tmux${NC}    - Symlinks tmux directory and tmux-which-key config (outside plugins/)

EOF
    exit 0
}

################################################################################
# Core Symlink Function (Shared)
################################################################################

create_symlink() {
    local source="$1"
    local target="$2"
    local description="${3:-}"

    # Show what we're doing
    if [ -n "$description" ]; then
        echo -e "\n${BLUE}→${NC} $description"
    fi

    # Validate source exists
    if [ ! -e "$source" ] && [ ! -L "$source" ]; then
        print_error "Source does not exist: $source"
        ((ERROR_COUNT++)) || true
        return 1
    fi

    # Check if symlink already correct (skip only if not forcing)
    if [ "$FORCE_UPDATE" = false ] && [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        print_warning "Already linked correctly: $target"
        ((SKIPPED_COUNT++)) || true
        return 0
    fi

    # Dry-run mode
    if [ "$DRY_RUN" = true ]; then
        if [ -e "$target" ] || [ -L "$target" ]; then
            print_info "[DRY-RUN] Would remove: $target"
        fi
        print_info "[DRY-RUN] Would create: $target → $source"
        ((CREATED_COUNT++)) || true
        return 0
    fi

    # Create parent directory if needed
    mkdir -p "$(dirname "$target")"

    # Remove existing file/directory/symlink
    if [ -e "$target" ] || [ -L "$target" ]; then
        rm -rf "$target"
        print_warning "Removed existing: $target"
    fi

    # Create symlink
    if ln -s "$source" "$target"; then
        print_success "Created: $target → $source"
        ((CREATED_COUNT++)) || true
    else
        print_error "Failed to create symlink: $target"
        ((ERROR_COUNT++)) || true
        return 1
    fi
}

################################################################################
# Special Setup Handlers
################################################################################

setup_zsh() {
    print_header "Setting up Zsh"

    local zsh_dir="$DOTFILES_DIR/zsh"

    # Check if zinit should be installed
    if [ ! -d "$HOME/.local/share/zinit/zinit.git" ] && [ "$DRY_RUN" = false ]; then
        print_info "Installing Zinit plugin manager..."
        bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
        print_success "Zinit installed"
    elif [ ! -d "$HOME/.local/share/zinit/zinit.git" ]; then
        print_info "[DRY-RUN] Would install Zinit plugin manager"
    else
        print_warning "Zinit already installed"
    fi

    # Create symlinks
    create_symlink "$zsh_dir/zshrc" "$HOME/.zshrc" "Symlinking zshrc to ~/.zshrc"
    create_symlink "$zsh_dir" "$HOME/.config/zsh" "Symlinking zsh directory to ~/.config/zsh"

    print_success "Zsh setup complete!"
}

setup_claude() {
    print_header "Setting up Claude Code"

    local claude_dir="$DOTFILES_DIR/claude"

    # Symlink agents directory
    if [ -d "$claude_dir/agents" ]; then
        create_symlink "$claude_dir/agents" "$HOME/.claude/agents" "Symlinking Claude agents"
    else
        print_warning ".claude/agents directory not found, skipping"
    fi

    # Symlink commands directory
    if [ -d "$claude_dir/commands" ]; then
        create_symlink "$claude_dir/commands" "$HOME/.claude/commands" "Symlinking Claude commands"
    else
        print_warning ".claude/commands directory not found, skipping"
    fi

    # Symlink settings.json
    if [ -f "$claude_dir/settings.json" ]; then
        create_symlink "$claude_dir/settings.json" "$HOME/.claude/settings.json" "Symlinking Claude settings"
    else
        print_warning ".claude/settings.json file not found, skipping"
    fi

    print_success "Claude Code setup complete!"
}

setup_tmux() {
    print_header "Setting up Tmux"

    local tmux_dir="$DOTFILES_DIR/tmux"

    # Symlink main tmux directory
    create_symlink "$tmux_dir" "$HOME/.config/tmux" "Symlinking tmux directory"

    # Create plugins/tmux-which-key directory if it doesn't exist
    if [ "$DRY_RUN" = false ]; then
        mkdir -p "$HOME/.config/tmux/plugins/tmux-which-key"
    else
        print_info "[DRY-RUN] Would create $HOME/.config/tmux/plugins/tmux-which-key directory"
    fi

    # Symlink tmux-which-key config (needs special handling since plugins/ is gitignored)
    if [ -f "$tmux_dir/tmux-which-key-config.yaml" ]; then
        create_symlink "$tmux_dir/tmux-which-key-config.yaml" \
                      "$HOME/.config/tmux/plugins/tmux-which-key/config.yaml" \
                      "Symlinking tmux-which-key config"
    else
        print_warning "tmux-which-key-config.yaml not found, skipping"
    fi

    print_success "Tmux setup complete!"
}

setup_opencode() {
    print_header "Setting up OpenCode"

    local opencode_dir="$DOTFILES_DIR/opencode"
    local global_command_dir="$HOME/.config/opencode/command"

    # Create global command directory if needed
    if [ "$DRY_RUN" = false ]; then
        mkdir -p "$global_command_dir"
    else
        print_info "[DRY-RUN] Would create $global_command_dir directory"
    fi

    # Symlink opencode commands to global config
    if [ -d "$opencode_dir/command/yuyudhan" ]; then
        create_symlink "$opencode_dir/command/yuyudhan" \
                       "$global_command_dir/yuyudhan" \
                       "Symlinking OpenCode commands to global config"
    else
        print_warning "opencode/command/yuyudhan directory not found, skipping"
    fi

    print_success "OpenCode setup complete!"
}

################################################################################
# Standard Tool Setup
################################################################################

# Symlink mappings (tool target pairs)
SYMLINK_MAPPINGS="
nvim:$HOME/.config/nvim
wezterm:$HOME/.config/wezterm
aerospace:$HOME/.config/aerospace
yazi:$HOME/.config/yazi
karabiner:$HOME/.config/karabiner
btop:$HOME/.config/btop
"

get_target_for_tool() {
    local tool="$1"
    echo "$SYMLINK_MAPPINGS" | grep "^$tool:" | cut -d: -f2
}

get_all_tools() {
    echo "$SYMLINK_MAPPINGS" | grep -v "^$" | cut -d: -f1
}

setup_tool() {
    local tool="$1"

    # Check for special handlers
    if [ "$tool" = "zsh" ]; then
        setup_zsh
        return
    fi

    if [ "$tool" = "claude" ]; then
        setup_claude
        return
    fi

    if [ "$tool" = "tmux" ]; then
        setup_tmux
        return
    fi

    if [ "$tool" = "opencode" ]; then
        setup_opencode
        return
    fi

    # Standard tool setup
    local target=$(get_target_for_tool "$tool")
    if [ -z "$target" ]; then
        print_error "Unknown tool: $tool"
        print_info "Available tools: $(get_all_tools | xargs) zsh claude tmux opencode"
        ((ERROR_COUNT++))
        return 1
    fi

    local source="$DOTFILES_DIR/$tool"
    create_symlink "$source" "$target" "Setting up $tool"
}

setup_all_tools() {
    print_header "Setting up all dotfiles"

    # Setup all standard tools
    for tool in $(get_all_tools); do
        echo ""
        setup_tool "$tool"
    done

    # Setup special handlers
    echo ""
    setup_zsh
    echo ""
    setup_claude
    echo ""
    setup_tmux
    echo ""
    setup_opencode
}

################################################################################
# Argument Parsing
################################################################################

parse_arguments() {
    local tools=()
    local setup_all=false

    # Parse options
    while [[ $# -gt 0 ]]; do
        case $1 in
        -h | --help)
            show_help
            ;;
        -d | --dry-run)
            DRY_RUN=true
            print_warning "Dry-run mode enabled - no changes will be made"
            shift
            ;;
        -f | --force)
            FORCE_UPDATE=true
            print_warning "Force mode enabled - will recreate all symlinks"
            shift
            ;;
        -a | --all)
            setup_all=true
            shift
            ;;
        -*)
            print_error "Unknown option: $1"
            echo "Use --help for usage information"
            exit 1
            ;;
        *)
            tools+=("$1")
            shift
            ;;
        esac
    done

    # Determine what to setup
    if [ "$setup_all" = true ] || [ ${#tools[@]} -eq 0 ]; then
        setup_all_tools
    else
        # Setup specific tools
        for tool in "${tools[@]}"; do
            echo ""
            setup_tool "$tool"
        done
    fi
}

################################################################################
# Summary Report
################################################################################

print_summary() {
    echo ""
    print_header "Summary"

    if [ "$DRY_RUN" = true ]; then
        print_info "Dry-run mode - no actual changes made"
    fi

    echo -e "${GREEN}Created/Updated:${NC} $CREATED_COUNT"
    echo -e "${YELLOW}Skipped:${NC} $SKIPPED_COUNT"
    echo -e "${RED}Errors:${NC} $ERROR_COUNT"

    echo ""
    if [ $ERROR_COUNT -eq 0 ]; then
        print_success "All operations completed successfully!"
    else
        print_warning "Completed with $ERROR_COUNT error(s)"
        exit 1
    fi
}

################################################################################
# Main Entry Point
################################################################################

main() {
    # Ensure running with bash
    if [ -z "$BASH_VERSION" ]; then
        echo "This script must be run with bash. Use: bash $0"
        exit 1
    fi

    # Parse and execute
    parse_arguments "$@"

    # Show summary
    print_summary
}

# Run main
main "$@"
