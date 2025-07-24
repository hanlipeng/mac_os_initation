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

    local target_path
    case "$1" in
        alias)
            target_path="$ZSH_CUSTOM_DIR/aliases/"
            ;;
        export)
            target_path="$ZSH_CUSTOM_DIR/exports/"
            ;;
        local)
            target_path="$ZSH_CUSTOM_DIR/exports/local.zsh"
            # Create the local file with a header if it doesn't exist
            if ! [ -f "$target_path" ]; then
                echo "# This file is for local, private environment variables and is NOT tracked by Git." > "$target_path"
                echo "# Place your API keys and other secrets here." >> "$target_path"
            fi
            ;;
        function)
            target_path="$ZSH_CUSTOM_DIR/functions/"
            ;;
        plugin)
            target_path="$ZSH_CUSTOM_DIR/plugins/plugins.zsh"
            ;;
        setting)
            target_path="$ZSH_CUSTOM_DIR/settings/oh-my-zsh.settings.zsh"
            ;;
        *)
            echo "Usage: zsh-edit [alias|export|local|function|plugin|setting]" >&2
            echo "       (or call without arguments to open the root config directory)" >&2
            return 1
            ;;
    esac

    $editor "$target_path"
}