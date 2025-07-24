# Gemini Project Context: Modular Zsh Configuration

## Project Overview

This project is a modular Zsh configuration management system. Its purpose is to replace a single, monolithic `~/.zshrc` file with a structured, version-controllable directory of configuration files. This makes managing aliases, environment variables, functions, and shell settings cleaner and more organized.

## Directory Structure

The core logic resides in the `zsh_config/` directory:

```
zsh_config/
├── README.md
├── core/
│   └── core.functions.zsh      # Core framework functions like zsh-edit
├── settings/
│   └── oh-my-zsh.settings.zsh  # Oh My Zsh theme and plugins
├── exports/
│   ├── api_keys.exports.zsh    # Public loader for secrets
│   ├── api_keys.local.zsh      # (Git Ignored) Private secrets file
│   └── path.exports.zsh        # PATH modifications
├── lib/
│   # User-supplied configurations for third-party tools
├── aliases/
│   # User-defined aliases
├── functions/
│   # User-defined functions
├── completions/
│   └── _zsh-edit.zsh           # Zsh completion script for the zsh-edit function
└── init.zsh                    # Core script that loads all configs
```

## Development Workflow

This project follows two key workflow principles:

1.  **Atomic Commits**: As per user request, Gemini will commit changes to the Git repository after each significant feature, fix, or refactor is completed. This ensures a clean, well-documented project history.

2.  **Framework Evolution**: When a new directory or a core feature is added to the framework, the `zsh-edit` function (`core/core.functions.zsh`) and its corresponding completion script (`completions/_zsh-edit.zsh`) will be updated to support it. This ensures the framework's tooling stays in sync with its structure.

## Key Files & Logic

-   `init.zsh`: The main entry point. It loads all configuration files in a specific order.
-   `core/core.functions.zsh`: Contains the `zsh-edit` helper function, the primary interface for editing configuration files.
-   `install.sh`: A setup script that creates the `~/.zsh_config` symbolic link.

## Core User Command: `zsh-edit`

The primary method for interacting with this configuration framework is the `zsh-edit` command. It supports keywords for every major component of the framework (e.g., `alias`, `export`, `secret`, `core`, `completion`). The command has full tab-completion support.
