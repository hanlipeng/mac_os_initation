#!/bin/zsh

# Find the directory where init.zsh is located to use as the root for our config
export ZSH_CUSTOM_DIR=${0:a:h}

# --- Stage 1: Definitions ---
# Load all configurations that define variables, aliases, and functions.
# The order here is important for dependencies (e.g., aliases before libs that use them).

typeset -a definition_dirs
definition_dirs=(
  "$ZSH_CUSTOM_DIR/settings"    # Oh My Zsh settings (theme, plugins)
  "$ZSH_CUSTOM_DIR/exports"     # Environment variables and secrets loader
  "$ZSH_CUSTOM_DIR/aliases"     # All alias definitions
  "$ZSH_CUSTOM_DIR/lib"         # Third-party tool configurations (pyenv, direnv)
  "$ZSH_CUSTOM_DIR/plugins"     # Zinit plugin definitions
  "$ZSH_CUSTOM_DIR/core"        # Core framework functions (zsh-edit)
  "$ZSH_CUSTOM_DIR/functions"   # User-defined functions
)

for dir in $definition_dirs; do
  if [[ -d "$dir" ]]; then
    for file in $(find "$dir" -name "*.zsh" -o -name "*.sh"); do
      if [[ -r "$file" ]]; then
        source "$file"
      fi
    done
  fi
done

# Clean up the definition directories array
unset definition_dirs

# --- Stage 2: Completions & Startup ---

# Add our custom completions directory to the function path
fpath=($ZSH_CUSTOM_DIR/completions $fpath)

# Initialize the completion system
# These lines are often in .zshrc; adding them here for robustness
autoload -U compinit
compinit -i

# Load all startup scripts that execute commands.
# These run last, ensuring the full environment is ready.
typeset -a startup_dirs
startup_dirs=(
  "$ZSH_CUSTOM_DIR/startup"
)

for dir in $startup_dirs; do
  if [[ -d "$dir" ]]; then
    for file in $(find "$dir" -name "*.zsh" -o -name "*.sh"); do
      if [[ -r "$file" ]]; then
        source "$file"
      fi
    done
  fi
done

# Clean up the startup directories array
unset startup_dirs