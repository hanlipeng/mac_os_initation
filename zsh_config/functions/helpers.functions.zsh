# Function to quickly edit zsh configuration files
zsh-edit() {
    # Use the editor defined by the user, or default to vim
    local editor=${EDITOR:-vim}
    
    # The root directory of our config, set by init.zsh
    if [ -z "$ZSH_CUSTOM_DIR" ]; then
        echo "Error: ZSH_CUSTOM_DIR is not set. Is the framework loaded correctly?"
        return 1
    fi

    # If no argument is provided, open the root directory of the zsh config
    if [ -z "$1" ]; then
        $editor "$ZSH_CUSTOM_DIR"
        return
    fi

    local file_to_edit
    case "$1" in
        alias|aliases)
            file_to_edit="$ZSH_CUSTOM_DIR/aliases/common.aliases.zsh"
            ;;
        export|exports|key|keys)
            file_to_edit="$ZSH_CUSTOM_DIR/exports/api_keys.exports.zsh"
            ;;
        path)
            file_to_edit="$ZSH_CUSTOM_DIR/exports/path.exports.zsh"
            ;;
        function|functions)
            file_to_edit="$ZSH_CUSTOM_DIR/functions/helpers.functions.zsh"
            ;;
        setting|settings)
            file_to_edit="$ZSH_CUSTOM_DIR/settings/oh-my-zsh.settings.zsh"
            ;;
        *)
            echo "Usage: zsh-edit [alias|export|path|function|setting]"
            echo "       (or call without arguments to open the root config directory)"
            return 1
            ;;
    esac

    # Open the selected file in the editor
    $editor "$file_to_edit"
}