# System Configuration & Dotfiles

This project automates the setup of a complete macOS development environment, from system software to a powerful, customized Zsh shell.

## Quick Start: New Mac Setup

To configure a new Mac from scratch, follow these steps:

1.  **Clone the repository** to your local machine:
    ```sh
    git clone <your-repo-url> ~/system_project
    ```

2.  **Customize your software list**:
    - Open the `macos_setup/Brewfile`.
    - Add, remove, or comment out the command-line tools (`brew`), GUI applications (`cask`), and fonts you want to install.

3.  **Run the main installation script**:
    ```sh
    cd ~/system_project/macos_setup
    bash install.sh
    ```

4.  **Follow the on-screen instructions**.
    - The script will ask for your confirmation before starting.
    - It will automatically install Homebrew, all the software listed in your `Brewfile`, and finally set up the custom Zsh configuration.

5.  **Restart your terminal**.
    - After the script finishes, close and reopen your terminal (or run `source ~/.zshrc`) to load your new, powerful shell environment.

## Zsh Configuration (`zsh_config`)

This project includes a sophisticated, modular Zsh configuration managed by the `zsh_config/` directory. The `macos_setup/install.sh` script installs it automatically.

### Key Features:

- **Modular Structure**: Configuration is split into `aliases`, `functions`, `plugins`, etc., for easy management.
- **Plugin Management**: Uses `zinit` for fast, automated plugin handling. Add plugins to `zsh_config/plugins/plugins.zsh`.
- **Quick Editing**: Use the `zsh-edit <keyword>` command (e.g., `zsh-edit alias`) to quickly open relevant configuration files.

For more details, see the `zsh_config/README.md` file.
