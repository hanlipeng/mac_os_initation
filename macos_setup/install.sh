#!/bin/bash

# macOS Setup Script
# This script automates the setup of a new Mac.

# --- Helper Functions ---
echo_info() {
    echo "[INFO] $1"
}

echo_success() {
    echo "[SUCCESS] $1"
}

echo_error() {
    echo "[ERROR] $1" >&2
    exit 1
}

# --- Main Logic ---

# 1. Welcome and Confirmation
echo_info "Starting macOS setup process."
read -p "This will install software and configure your system. Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo_info "Setup cancelled by user."
    exit 0
fi

# 2. Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo_info "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ $? -ne 0 ]; then
        echo_error "Homebrew installation failed."
    fi
    echo_success "Homebrew installed successfully."
else
    echo_info "Homebrew is already installed."
fi

# 3. Run Brew Bundle to install packages
echo_info "Installing software from Brewfile..."
brew bundle --file="$(dirname "$0")/Brewfile"
if [ $? -ne 0 ]; then
    echo_error "Brew bundle command failed. Please check your Brewfile."
fi
echo_success "All software from Brewfile installed."

# 4. Install Zsh Configuration
echo_info "Installing custom Zsh configuration..."
# Assuming the main project install script is in the parent directory
PROJECT_ROOT=$(dirname "$0")/..
if [ -f "$PROJECT_ROOT/install.sh" ]; then
    /bin/bash "$PROJECT_ROOT/install.sh"
    if [ $? -ne 0 ]; then
        echo_error "Zsh configuration installation failed."
    fi
    echo_success "Zsh configuration installed."
else
    echo_error "Could not find the main install.sh for Zsh config."
fi

# 5. Final Instructions
echo_success "macOS setup complete!"
echo_info "Please restart your terminal or run 'source ~/.zshrc' to apply all changes."
