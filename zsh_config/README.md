# Zsh Configuration Project

This project manages your Zsh terminal configuration in a modular way.

## How to Use

1.  **Installation**: Run the `install.sh` script to create a symbolic link from `~/.zsh_config` to this directory and to update your `~/.zshrc`.
2.  **Add Aliases**: Place your alias definitions in `.zsh` files inside the `aliases/` directory.
3.  **Add Environment Variables**: Place your `export` statements in `.zsh` files inside the `exports/` directory.
4.  **Add Functions**: Place your custom shell functions in `.zsh` files inside the `functions/` directory.
5.  **Add Plugins**: Add your desired plugins to `plugins/plugins.zsh`. They will be automatically installed and loaded by `zinit`.

After adding or changing any file, restart your terminal or run `source ~/.zshrc` to apply the changes.
