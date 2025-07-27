# Gemini Project Context: System Configuration Engine

## Project Overview

This project has evolved into a comprehensive system configuration engine, primarily targeting macOS. Its main purpose is to automate the setup of a complete development environment from a clean slate.

The project is composed of two main modules:

The project is orchestrated by a unified `install.sh` script in the root directory, which in turn calls the specialized installers for each module.

1.  **`macos_setup`**: A module that handles the installation of system-level dependencies, software, and applications via Homebrew.
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
    ├── install.sh    # Script to symlink config to the home directory
    ├── init.zsh      # Core Zsh loading script
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
4.  **Language**: All communication will be in Chinese; code comments, git submit message and other use english.

## Task Persistence and Recovery

To ensure robustness against interruptions (e.g., closing the terminal), this project uses a task persistence and recovery mechanism centered around a standardized task file. The process is strictly enforced to guarantee accurate state tracking.

1.  **Task Template**: All tasks are defined based on the `.gemini_task.json.example` template located in the project root. This file serves as the official, version-controlled schema for any new task.
2.  **Task Planning & Serialization**: For any multi-step task, Gemini will first read the `.gemini_task.json.example` template. It will then populate this structure with the specific steps of the new task and save it as `.gemini_task.json` in the project root *before* execution begins.
3.  **State Tracking**: The `.gemini_task.json` file tracks the status of each step (e.g., `pending`, `completed`). **Crucially, immediately after a step is successfully executed, Gemini MUST update its status to `completed` in the file before proceeding to the next step.** This ensures the task state is always synchronized with the execution progress.
4.  **Interruption & Recovery**: If the `gemini-cli` session is terminated, the `.gemini_task.json` file remains on disk. Upon restart, Gemini will detect this file and prompt to resume the task from the last uncompleted step.
5.  **Task Completion**: Once all steps in the plan are successfully executed, the `.gemini_task.json` file is automatically deleted.

## Core User Command: `zsh-edit`

The primary method for interacting with this configuration framework is the `zsh-edit` command. It supports keywords for every major component of the framework and has full tab-completion.