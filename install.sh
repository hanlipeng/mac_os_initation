#!/bin/bash

# Unified installer for the system_project

# Get the absolute path of the script's directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# --- Usage Function ---
usage() {
  cat << EOF
Usage: $(basename "${BASH_SOURCE[0]}") [options]

This script is the main entry point for setting up the development environment.

Options:
  --macos       Installs macOS applications and system dependencies via Homebrew.
  --zsh         Installs the Zsh configuration framework.
  --all         (Default) Installs both macOS setup and Zsh configuration.
  -h, --help    Displays this help message.
EOF
  exit 1
}

# --- Installation Functions ---

# Function to run the macOS setup
install_macos() {
  echo "🚀 Starting macOS setup..."
  bash "${SCRIPT_DIR}/macos_setup/install.sh"
  echo "✅ macOS setup complete."
}

# Function to run the Zsh configuration setup
install_zsh() {
  echo "🚀 Starting Zsh configuration..."
  bash "${SCRIPT_DIR}/zsh_config/install.sh"
  echo "✅ Zsh configuration complete."
}

# --- Argument Parsing ---
if [ $# -eq 0 ]; then
  # Default action: install all
  install_macos
  install_zsh
  exit 0
fi

while (("$#")); do
  case "$1" in
    --macos)
      install_macos
      shift
      ;;
    --zsh)
      install_zsh
      shift
      ;;
    --all)
      install_macos
      install_zsh
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Error: Invalid option '$1'"
      usage
      ;;
  esac
done