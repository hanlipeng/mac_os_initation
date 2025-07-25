# ------------------------------------------------------------------------------
# Custom User Configurations (Example)
# ------------------------------------------------------------------------------
#
# This is an example file for adding your own personal configurations.
# The zsh_config/lib directory is loaded automatically on shell startup.
#
# HOW TO USE:
# 1. Create a new file in this directory (e.g., `my_stuff.zsh`).
# 2. Add your custom shell commands, exports, or tool initializations.
#
# Alternatively, you can rename this file to `custom.zsh` (or any other name
# not ending in `.example.zsh`) and uncomment the examples below.
#
# ------------------------------------------------------------------------------

# --- Example 1: Initializing pyenv ---
# If you use pyenv for Python version management, uncomment these lines.
#
# if command -v pyenv &>/dev/null; then
#   export PYENV_ROOT="$HOME/.pyenv"
#   [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init - zsh)"
# fi


# --- Example 2: Initializing direnv ---
# If you use direnv to manage directory-specific environments, uncomment this line.
#
# if command -v direnv &>/dev/null; then
#   eval "$(direnv hook zsh)"
# fi
