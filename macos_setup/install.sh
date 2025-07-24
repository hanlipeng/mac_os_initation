#!/bin/bash

# macOS Setup Script
# This script automates the setup of a new Mac by installing Homebrew,
# running the Brewfile, and setting up the Zsh configuration.

# --- Helper Functions ---
info() { echo "[INFO] $1"; }
success() { echo "[SUCCESS] $1"; }
error() { echo "[ERROR] $1" >&2; exit 1; }

# --- Pre-flight Checks ---
# Ensure the script is not run as root
if [[ $EUID -eq 0 ]]; then
   error "This script must not be run as root."
fi

# --- Main Logic ---
main() {
    info "Starting macOS setup process."
    read -p "This will install software and configure your system. Continue? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        info "Setup cancelled by user."
        exit 0
    fi

    # Install Homebrew
    if ! command -v brew &> /dev/null; then
        info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || error "Homebrew installation failed."
        success "Homebrew installed."
    else
        info "Homebrew is already installed."
    fi

    # Run Brew Bundle
    info "Installing software from Brewfile..."
    brew bundle --file="$(dirname "$0")/Brewfile" || error "Brew bundle command failed."
    success "Software from Brewfile installed."

    # Install Zsh Configuration
    info "Installing Zsh configuration..."
    local zsh_install_script
    zsh_install_script="$(dirname "$0")/../zsh_config/install.sh"
    if [ -f "$zsh_install_script" ]; then
        /bin/bash "$zsh_install_script" || error "Zsh configuration installation failed."
        success "Zsh configuration installed."
    else
        error "Zsh install script not found at $zsh_install_script"
    fi

    success "macOS setup complete!"
    info "Please restart your terminal to apply all changes."
}

main "$@"
