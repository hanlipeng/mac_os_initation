# Gemini Project Context: Modular Zsh Configuration

## Project Overview

This project is a modular Zsh configuration management system. Its purpose is to replace a single, monolithic `~/.zshrc` file with a structured, version-controllable directory of configuration files. This makes managing aliases, environment variables, functions, and shell settings cleaner and more organized.

The user's original `~/.zshrc` file has been analyzed and its contents have been migrated into this new structure.

## Directory Structure

The core logic resides in the `zsh_config/` directory:

```
zsh_config/
├── README.md
├── settings/
│   └── oh-my-zsh.settings.zsh  # Oh My Zsh theme and plugins
├── exports/
│   ├── api_keys.exports.zsh    # API keys and secrets
│   └── path.exports.zsh        # PATH modifications
├── lib/
│   ├── direnv.zsh              # direnv initialization
│   ├── proxy.zsh               # proxy script execution
│   └── pyenv.zsh               # pyenv initialization
├── aliases/
│   └── common.aliases.zsh      # User-defined aliases
├── functions/
│   └── helpers.functions.zsh   # Contains the zsh-edit helper function
├── completions/
│   └── _zsh-edit.zsh           # Zsh completion script for the zsh-edit function
└── init.zsh                    # Core script that loads all configs
```

## Key Files & Logic

-   `zsh_config/init.zsh`: The main entry point. It loads files in a specific order (`settings`, `exports`, `lib`, `aliases`, `functions`). It also adds the `completions` directory to the Zsh `fpath` and initializes the completion system (`compinit`) so that custom completions are available.

-   `zsh_config/functions/helpers.functions.zsh`: Contains the `zsh-edit` helper function, which is the primary interface for editing configuration files.

-   `install.sh`: A setup script that creates a symbolic link from `~/.zsh_config` to the `zsh_config` directory in this project. It also correctly and safely modifies the user's `~/.zshrc` to source the `init.zsh` script.

-   `GEMINI.md`: This file, containing the project context.

## Installation & Loading Logic

The user's `~/.zshrc` file is configured to source `~/.zsh_config/init.zsh` **before** sourcing the main `oh-my-zsh.sh` script. This is critical for ensuring that settings like `ZSH_THEME` and `plugins` are set correctly before Oh My Zsh initializes.

## Core Workflow

The primary method for interacting with this configuration framework is the `zsh-edit` command.

1.  To edit a specific part of the configuration, use `zsh-edit [keyword]`. For example:
    *   `zsh-edit alias` opens the aliases file.
    *   `zsh-edit export` opens the API keys file.
    *   `zsh-edit path` opens the PATH configuration.
2.  The command supports tab-completion for all its keywords.
3.  To open the entire project folder in the default editor, run `zsh-edit` with no arguments.
4.  After making changes, run `source ~/.zshrc` to apply them to the current session.

## Version Control

The project has been initialized as a Git repository to track changes and facilitate versioning. A `.gitignore` file is included to exclude IDE-specific settings (like `.vscode/`, `.idea/`) and system files (like `.DS_Store`) from version control.

### Development Workflow

As per user request, Gemini will commit changes to the Git repository after each significant feature, fix, or update is completed. This ensures atomic, well-documented commits.