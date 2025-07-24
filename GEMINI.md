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

This project follows a set of autonomous and collaborative principles:

1.  **Autonomous Documentation**: After completing a significant change (new feature, refactor, or workflow adjustment), Gemini will autonomously determine if the `GEMINI.md` context file needs updating. If so, it will be updated to reflect the latest state of the project.

2.  **Atomic Commits**: All related code and documentation changes will be bundled into a single, atomic commit with a clear, descriptive message. This ensures a clean and understandable project history.

3.  **Framework Evolution**: When a new directory or a core feature is added, the framework's own tools (e.g., `zsh-edit` and its completions) will be updated to support it, keeping the project self-consistent.

## Key Files & Logic

-   `init.zsh`: The main entry point. It loads all configuration files in a specific order.
-   `core/core.functions.zsh`: Contains the `zsh-edit` helper function, the primary interface for editing configuration files.
-   `install.sh`: A setup script that creates the `~/.zsh_config` symbolic link.

## Core User Command: `zsh-edit`

The primary method for interacting with this configuration framework is the `zsh-edit` command. It supports keywords for every major component of the framework (e.g., `alias`, `export`, `secret`, `core`, `completion`). The command has full tab-completion support.