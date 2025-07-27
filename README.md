# System Configuration & Dotfiles

This project provides a comprehensive, automated engine for setting up a complete macOS development environment from a clean slate. It handles everything from system-level software to a powerful, customized Zsh shell.

## Overview

The framework is composed of two primary modules that work together:

1.  **`macos_setup`**: The main entry point and installation engine. It automates the installation of all system dependencies (via Homebrew) and **automatically deploys the `zsh_config` module** to create a unified, ready-to-use environment.
2.  **`zsh_config`**: A sophisticated, modular Zsh configuration framework. While it is designed to be managed by `macos_setup`, it is also fully independent and can be installed separately.

## Quick Start: Full macOS Setup

This is the recommended approach for setting up a new Mac.

1.  **Clone the Repository**:
    ```sh
    git clone git@github.com:hanlipeng/mac_os_initation.git ~/your-project-directory
    ```

2.  **Customize Your Software List**:
    - Open `macos_setup/Brewfile`.
    - Add, remove, or comment out the command-line tools (`brew`), GUI applications (`cask`), and fonts (`font`) you wish to install.

3.  **Run the Main Installer**:
    ```sh
    cd ~/your-project-directory/macos_setup
    bash install.sh
    ```
    This script will install Homebrew, all software from the `Brewfile`, and then automatically run the `zsh_config` installer.

4.  **Restart Your Terminal**:
    - Once the script is complete, restart your terminal to load your new, powerful shell environment.

## Brewfile Management

To update the `macos_setup/Brewfile` with all currently installed Homebrew packages, you can run the `brew-dump.sh` script. This script will merge the existing Brewfile with the newly installed packages, remove duplicates, and create a backup of the old file.

```bash
./macos_setup/brew-dump.sh
```

## Standalone Zsh Configuration (`zsh_config`)

The `zsh_config` module is a standalone, powerful Zsh framework designed for modularity and performance. You can use it on any system with Zsh, even without the `macos_setup` components.

### Independent Installation

If you only want to install the Zsh configuration, run its dedicated installer:
```sh
cd ~/your-project-directory/zsh_config
bash install.sh
```
This will create symbolic links from the repository to the correct locations in your home directory (e.g., `~/.zshrc`, `~/.zsh_config`).

### Key Features

- **Modular Structure**: Configuration is logically split into self-contained directories (`aliases`, `functions`, `plugins`, `settings`, etc.).
- **Optimized Loading**: A smart two-stage loading process prevents common dependency and ordering issues.
- **Powerful Plugin Management**: Uses `zinit` for incredibly fast plugin handling. Edit `zsh_config/plugins/plugins.zsh` to manage plugins.
- **Easy Editing**: Includes a built-in `zsh-edit <keyword>` command (e.g., `zsh-edit alias`) with full tab-completion for quick edits.

### How to Customize

- **To Add Aliases**: Create a new `.zsh` file in the `aliases/` directory.
- **To Set Environment Variables**: Add a new `.zsh` file with `export` statements to the `exports/` directory.
- **To Add Functions**: Place your custom function scripts in the `functions/` directory.

Changes are applied automatically when you open a new terminal session.