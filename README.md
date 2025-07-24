# System Configuration & Dotfiles

This project provides a comprehensive, automated engine for setting up a complete macOS development environment from a clean slate. It handles everything from system-level software to a powerful, customized Zsh shell.

## Overview

The framework is composed of two primary modules that work together:

1.  **`macos_setup`**: The main entry point and installation engine. It automates the installation of Homebrew, system software, GUI applications, and fonts defined in a `Brewfile`.
2.  **`zsh_config`**: A sophisticated, modular Zsh configuration framework that is automatically installed and configured by the `macos_setup` engine.

## Quick Start: New Mac Setup

To configure a new Mac from scratch, follow these steps:

1.  **Clone the Repository**:
    ```sh
    git clone https://github.com/your-username/your-repo-name.git ~/your-project-directory
    ```

2.  **Customize Your Software List**:
    - Open `macos_setup/Brewfile`.
    - Add, remove, or comment out the command-line tools (`brew`), GUI applications (`cask`), and fonts (`font`) you wish to install.

3.  **Run the Installation**:
    ```sh
    cd ~/your-project-directory/macos_setup
    bash install.sh
    ```

4.  **Follow On-Screen Instructions**:
    - The script will ask for confirmation before proceeding.
    - It will automatically install Homebrew (if not present), all software from the `Brewfile`, and finally set up the Zsh environment.

5.  **Restart Your Terminal**:
    - Once the script is complete, restart your terminal to load your new, powerful shell environment.

## Zsh Configuration (`zsh_config`)

The `zsh_config` module provides a robust, modular, and high-performance Zsh environment. It is designed to be automatically deployed by the `macos_setup` script.

### Key Features

- **Modular Structure**: Configuration is logically split into directories like `aliases`, `functions`, `plugins`, and `settings` for clean and easy management.
- **Optimized Loading**: A two-stage loading process in `init.zsh` ensures that all functions and aliases are available before startup scripts are executed, preventing dependency issues.
- **Plugin Management**: Leverages `zinit` for fast, automated plugin handling. To add or remove plugins, simply edit `zsh_config/plugins/plugins.zsh`.
- **Easy Editing**: Use the built-in `zsh-edit <keyword>` command (e.g., `zsh-edit alias`, `zsh-edit function`) to quickly open the relevant configuration files.

### Customization

- **Aliases**: Add new `.zsh` files with your aliases to the `aliases/` directory.
- **Environment Variables**: Add new `.zsh` files with your `export` statements to the `exports/` directory.
- **Functions**: Add your custom shell functions as `.zsh` files in the `functions/` directory.

Changes will be applied automatically when you restart your terminal.