# Gemini Project Context: System Configuration Engine

## Project Overview

This project has evolved into a comprehensive system configuration engine, primarily targeting macOS. Its main purpose is to automate the setup of a complete development environment from a clean slate.

The project is composed of two main modules:

1.  **`macos_setup`**: The primary entry point and installation engine. It handles the installation of system-level dependencies, software, and applications via Homebrew. It then orchestrates the deployment of other components, such as the Zsh configuration.
2.  **`zsh_config`**: A sophisticated, modular Zsh configuration framework. It is designed to be installed and managed by the `macos_setup` engine, providing a powerful, customized shell environment.

## Directory Structure

The framework is organized into two distinct, high-level modules:

```
./
├── macos_setup/      # macOS installation and setup engine
│   ├── install.sh    # The main script to run on a new Mac
│   └── Brewfile      # Defines all software to be installed
│
└── zsh_config/       # Modular Zsh configuration framework
    ├── init.zsh      # Core Zsh loading script
    ├── install.sh    # Script to symlink config to the home directory
    ├── aliases/
    ├── functions/
    ├── plugins/
    └── ... (other zsh components)
```

## Loading Architecture

The `init.zsh` script implements a robust two-stage loading process to prevent dependency issues:

1.  **Definition Stage**: Loads all directories that define the shell environment (`settings`, `exports`, `aliases`, `lib`, `plugins`, `core`, `functions`). After this stage, all variables, aliases, and functions are available.
2.  **Startup Stage**: Executes all scripts in the `startup/` directory. These scripts can safely use any alias or function defined in the first stage.

## Development Workflow

This project follows a set of autonomous and collaborative principles:

1.  **Autonomous Documentation**: After completing a significant change, Gemini will autonomously update this `GEMINI.md` and `README.md` file.
2.  **Atomic Commits**: All related code and documentation changes will be bundled into a single, atomic commit.
3.  **Framework Evolution**: The framework's own tools (e.g., `zsh-edit`) will be updated to stay in sync with the project structure.
4.  **Language**: All communication will be in Chinese.

## Core User Command: `zsh-edit`

The primary method for interacting with this configuration framework is the `zsh-edit` command. It supports keywords for every major component of the framework and has full tab-completion.
