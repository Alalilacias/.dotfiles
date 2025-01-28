# ref: https://github.com/Phantas0s/.dotfiles/blob/master/zsh/zshenv

# Set the path to include ~/.dotfiles/bin
export PATH="$HOME/.dotfiles/bin:$PATH"

# Set the XDG base directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set editor to Neovim (or your preferred editor)
export EDITOR="nvim"
export VISUAL="nvim"

# Set language (optional)
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Source additional environment variables (if any)
if [ -f "$HOME/.env" ]; then
    source "$HOME/.env"
fi
