#compdef zsh-edit

_zsh_edit_completions() {
    local -a commands
    commands=(
        'alias:Edit alias configuration'
        'aliases:Edit alias configuration'
        'export:Edit the public exports loader file'
        'exports:Edit the public exports loader file'
        'secret:Edit the private/local secrets file'
        'secrets:Edit the private/local secrets file'
        'local:Edit the private/local secrets file'
        'path:Edit PATH configuration'
        'function:Open user functions directory'
        'functions:Open user functions directory'
        'setting:Edit Oh My Zsh settings'
        'settings:Edit Oh My Zsh settings'
        'core:Edit the core framework functions'
        'completion:Edit the zsh-edit completion script'
        'completions:Edit the zsh-edit completion script'
    )
    _describe 'command' commands
}

_zsh_edit_completions "$@"