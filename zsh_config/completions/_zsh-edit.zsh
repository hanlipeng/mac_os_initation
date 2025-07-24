#compdef zsh-edit

# This is a Zsh completion script for the `zsh-edit` function.

_zsh_edit_completions() {
    local -a commands
    commands=(
        'alias:Edit alias configuration'
        'aliases:Edit alias configuration'
        'export:Edit environment variables and API keys'
        'exports:Edit environment variables and API keys'
        'key:Edit environment variables and API keys'
        'keys:Edit environment variables and API keys'
        'path:Edit PATH configuration'
        'function:Edit helper functions'
        'functions:Edit helper functions'
        'setting:Edit Oh My Zsh settings'
        'settings:Edit Oh My Zsh settings'
    )
    _describe 'command' commands
}

_zsh_edit_completions "$@"
