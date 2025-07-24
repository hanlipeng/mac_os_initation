# zinit.zsh

# Auto-install zinit if not already installed
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
    echo "Installing zinit..."
    mkdir -p ~/.zinit
    git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

# Load zinit
source ~/.zinit/bin/zinit.zsh
