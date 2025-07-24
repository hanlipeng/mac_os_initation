#!/bin/bash

# Zsh Configuration Installation Script
# This script safely creates a symbolic link to the zsh_config directory
# and sources the configuration in the user's .zshrc file.

# --- Helper Functions ---
info() { echo "[INFO] $1"; }
success() { echo "[SUCCESS] $1"; }
error() { 
    echo "[ERROR] $1" >&2
    echo "[INFO] Installation aborted to prevent data loss." >&2
    exit 1 
}
warn() { echo "[WARN] $1"; }

# --- Main Logic ---
main() {
    info "Starting Zsh configuration installation."

    local source_dir
    source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local target_link
    target_link="${HOME}/.zsh_config"

    # --- Safely handle the symbolic link creation ---
    info "Checking status of ${target_link}"
    if [ -e "${target_link}" ]; then
        if [ -L "${target_link}" ]; then
            if [ "$(readlink "${target_link}")" = "${source_dir}" ]; then
                info "Correct symbolic link already exists. No action needed."
            else
                error "A symbolic link already exists at ${target_link} but points to a different location: $(readlink "${target_link}"). Please remove it manually and re-run the script."
            fi
        else
            error "A file or directory already exists at ${target_link}. Please back it up, remove it, and then re-run this script."
        fi
    else
        info "Creating new symbolic link: ${target_link} -> ${source_dir}"
        ln -s "${source_dir}" "${target_link}" || error "Failed to create symbolic link."
        success "Symbolic link created successfully."
    fi

    # --- Add sourcing line to .zshrc ---
    local zshrc_file
    zshrc_file="${HOME}/.zshrc"
    local source_line
    source_line="source '${target_link}/init.zsh'"

    info "Checking for source line in ${zshrc_file}"
    if grep -qF -- "${source_line}" "${zshrc_file}" 2>/dev/null; then
        info "Source line already exists in ${zshrc_file}."
    else
        info "Adding source line to ${zshrc_file}."
        echo -e "\n# Load custom Zsh configuration from system_project\n${source_line}\n" >> "${zshrc_file}" || error "Failed to write to ${zshrc_file}."
        success "Source line added."
    fi

    success "Zsh configuration installed successfully."
    info "Please restart your terminal or run 'source ${zshrc_file}' to apply changes."
}

main "$@"