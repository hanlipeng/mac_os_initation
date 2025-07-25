# Zsh Custom Functions - Examples
# ---------------------------------
#
# This directory is for your custom shell functions.
# You can create multiple files here, and they will all be loaded automatically.
#
# Below are some examples. To use them, you can either:
#   1. Uncomment them in this file.
#   2. Copy them to a new file in this directory, e.g., `my_functions.zsh`.

# Example 1: Create a directory and change into it
# function mkcd() {
#   mkdir -p "$1" && cd "$1"
# }

# Example 2: Extract any archive file
# function extract() {
#   if [ -f "$1" ] ; then
#     case "$1" in
#       *.tar.bz2)   tar xjf "$1"     ;;
#       *.tar.gz)    tar xzf "$1"     ;;
#       *.bz2)       bunzip2 "$1"     ;;
#       *.rar)       unrar x "$1"     ;;
#       *.gz)        gunzip "$1"      ;;
#       *.tar)       tar xf "$1"      ;;
#       *.tbz2)      tar xjf "$1"     ;;
#       *.tgz)       tar xzf "$1"     ;;
#       *.zip)       unzip "$1"       ;;
#       *.Z)         uncompress "$1"  ;;
#       *)           echo "'$1' cannot be extracted via extract()" ;;
#     esac
#   else
#     echo "'$1' is not a valid file"
#   fi
# }
