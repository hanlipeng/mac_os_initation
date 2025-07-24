# Function to quickly edit zsh configuration files
zsh-edit() {
    local editor=${EDITOR:-vim}
    if [ -z "$ZSH_CUSTOM_DIR" ]; then
        echo "Error: ZSH_CUSTOM_DIR is not set." >&2
        return 1
    fi

    if [ -z "$1" ]; then
        $editor "$ZSH_CUSTOM_DIR"
        return
    fi

    local file_to_edit
    case "$1" in
        alias|aliases)
            file_to_edit="$ZSH_CUSTOM_DIR/aliases/common.aliases.zsh"
            ;;
        export|exports)
            # Opens the loader file, which is more correct.
            file_to_edit="$ZSH_CUSTOM_DIR/exports/api_keys.exports.zsh"
            ;;
        secret|secrets|local)
            # Add a specific keyword for the local/secret file
            file_to_edit="$ZSH_CUSTOM_DIR/exports/api_keys.local.zsh"
            ;;
        path)
            file_to_edit="$ZSH_CUSTOM_DIR/exports/path.exports.zsh"
            ;;
        function|functions)
            # This directory is for user functions, so open the directory itself
            $editor "$ZSH_CUSTOM_DIR/functions/"
            return
            ;;
        setting|settings)
            file_to_edit="$ZSH_CUSTOM_DIR/settings/oh-my-zsh.settings.zsh"
            ;;
        core)
            file_to_edit="$ZSH_CUSTOM_DIR/core/core.functions.zsh"
            ;;
        completion|completions)
            file_to_edit="$ZSH_CUSTOM_DIR/completions/_zsh-edit.zsh"
            ;;
        *)
            echo "Usage: zsh-edit [alias|export|secret|path|function|setting|core|completion]" >&2
            echo "       (or call without arguments to open the root config directory)" >&2
            return 1
            ;;
    esac

    # Create the local secrets file with a header if it doesn't exist
    if [[ "$1" == "secret" || "$1" == "secrets" || "$1" == "local" ]] && ! [ -f "$file_to_edit" ]; then
        echo "# This file is for local, private environment variables and is NOT tracked by Git." > "$file_to_edit"
        echo "# Place your API keys and other secrets here." >> "$file_to_edit"
    fi

    $editor "$file_to_edit"
}
