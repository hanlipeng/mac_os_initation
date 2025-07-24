#!/bin/bash

# This script installs the zsh configuration.

# Get the absolute path to the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
CONFIG_DIR="$SCRIPT_DIR/zsh_config"

# Destination for the symbolic link
DEST_LINK="$HOME/.zsh_config"

# Path to the main zshrc file
ZSHRC_FILE="$HOME/.zshrc"

# 1. Create symbolic link
if [ -L "$DEST_LINK" ] || [ -d "$DEST_LINK" ]; then
    echo "~/.zsh_config already exists. Please remove it first."
else
    echo "Creating symbolic link: $DEST_LINK -> $CONFIG_DIR"
    ln -s "$CONFIG_DIR" "$DEST_LINK"
fi

# 2. Add sourcing line to .zshrc
if ! grep -q "source ~/.zsh_config/init.zsh" "$ZSHRC_FILE"; then
    echo "Adding source line to $ZSHRC_FILE"
    printf '\n# Load custom Zsh configuration\nsource ~/.zsh_config/init.zsh\n' >> "$ZSHRC_FILE"
    echo "Installation complete! Please restart your terminal or run 'source ~/.zshrc'."
else
    echo "Source line already exists in $ZSHRC_FILE. No changes made."
fi
