# Gemini Project Context: Modular Zsh Configuration

## Project Overview

This project is a modular Zsh configuration management system. Its purpose is to replace a single, monolithic `~/.zshrc` file with a structured, version-controllable directory of configuration files. This makes managing aliases, environment variables, functions, and shell settings cleaner and more organized.

## Directory Structure

The framework is organized to clearly separate definitions from execution scripts:

```
zsh_config/
├── README.md
├── core/         # Core framework functions (e.g., zsh-edit)
├── settings/     # Oh My Zsh theme and plugin settings
├── exports/      # Environment variables and secrets loaders
├── aliases/      # User-defined aliases
├── lib/          # Configurations for 3rd-party tools (pyenv, direnv)
├── plugins/      # Zinit plugin definitions
├── functions/    # User-defined functions
├── completions/  # Zsh completion scripts
└── startup/      # Scripts to be executed at the end of the loading process
```

## Loading Architecture

The `init.zsh` script implements a robust two-stage loading process to prevent dependency issues:

1.  **Definition Stage**: Loads all directories that define the shell environment (`settings`, `exports`, `aliases`, `lib`, `plugins`, `core`, `functions`). After this stage, all variables, aliases, and functions are available.
2.  **Startup Stage**: Executes all scripts in the `startup/` directory. These scripts can safely use any alias or function defined in the first stage.

## Development Workflow

This project follows a set of autonomous and collaborative principles:

1.  **Autonomous Documentation**: After completing a significant change, Gemini will autonomously update this `GEMINI.md` file.
2.  **Atomic Commits**: All related code and documentation changes will be bundled into a single, atomic commit.
3.  **Framework Evolution**: The framework's own tools (e.g., `zsh-edit`) will be updated to stay in sync with the project structure.

## Core User Command: `zsh-edit`

The primary method for interacting with this configuration framework is the `zsh-edit` command. It supports keywords for every major component of the framework and has full tab-completion.
