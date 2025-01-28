#!/usr/bin/env bash
#
# Author: Alalilacias
# Description: Creates all connections necessary for the system to use the configurations set in this directory
# Syntax: ./connections.sh
# Version: 0.2

echo "Creating symlinks and giving permissions to necessary files"

# Dotfiles path (configurable via environment variable)
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
# Subdirectory paths
DOTFILES_BIN="$DOTFILES_DIR/bin"
DOTFILES_CONFIG="$DOTFILES_DIR/.config"
DOTFILES_SUBMODULES="$DOTFILES_DIR/submodules"

# Debugging: Print paths
# echo "DOTFILES_DIR: $DOTFILES_DIR"
# echo "DOTFILES_BIN: $DOTFILES_BIN"
# echo "DOTFILES_CONFIG: $DOTFILES_CONFIG"

# Make necessary scripts executable
echo "Making yq executable..."
if [[ -f "$DOTFILES_BIN/yq" ]]; then
    chmod +x "$DOTFILES_BIN/yq" && echo "Success!" || echo "Failed!"
else
    echo "Error: $DOTFILES_BIN/yq does not exist."
    exit 1
fi

# Symlink necessary folders
echo "Creating symlink for xdg-ninja..."
ln -sf "$DOTFILES_SUBMODULES/xdg-ninja/xdg-ninja.sh" "$DOTFILES_BIN/xdg-ninja"
if [[ ! -L "$DOTFILES_BIN/xdg-ninja" ]]; then
    echo "Error: Failed to create symlink for xdg-ninja"
    exit 1
fi

# Zsh
echo "Creating symlink for .zshenv..."
ln -sf "$DOTFILES_CONFIG/zsh/.zshenv" "$HOME/.zshenv"
if [[ ! -L "$HOME/.zshenv" ]]; then
    echo "Error: Failed to create symlink for .zshenv"
    exit 1
fi

echo "Creating symlink for .zshrc..."
ln -sf "$DOTFILES_CONFIG/zsh/.zshrc" "$HOME/.zshrc"
if [[ ! -L "$HOME/.zshrc" ]]; then
    echo "Error: Failed to create symlink for .zshrc"
    exit 1
fi

# Testing out different ways to configure the code. Might refactor later.
# Kitty
echo "Creating symlink for Kitty configuration..."
KITTY_CONFIG_SOURCE="$DOTFILES_CONFIG/kitty"
KITTY_CONFIG_TARGET="$HOME/.config/kitty"
if [[ -d "$KITTY_CONFIG_SOURCE" ]]; then
    # Remove the target directory if it exists
    if [[ -e "$KITTY_CONFIG_TARGET" ]]; then
        echo "Removing existing target directory: $KITTY_CONFIG_TARGET"
        rm -rf "$KITTY_CONFIG_TARGET"
    fi
    # Create the symlink
    ln -sf "$KITTY_CONFIG_SOURCE" "$KITTY_CONFIG_TARGET" && echo "Success!" || echo "Failed!"
else
    echo "Error: $KITTY_CONFIG_SOURCE does not exist."
    exit 1
fi

# Neovim
echo "Creating symlink for Neovim configuration..."
NVIM_CONFIG_SOURCE="$DOTFILES_CONFIG/nvim"
NVIM_CONFIG_TARGET="$HOME/.config/nvim"
if [[ -d "$NVIM_CONFIG_SOURCE" ]]; then
    # Remove the target directory if it exists
    if [[ -e "$NVIM_CONFIG_TARGET" ]]; then
        echo "Removing existing target directory: $NVIM_CONFIG_TARGET"
        rm -rf "$NVIM_CONFIG_TARGET"
    fi
    # Create the symlink
    ln -sf "$NVIM_CONFIG_SOURCE" "$NVIM_CONFIG_TARGET" && echo "Success!" || echo "Failed!"
else
    echo "Error: $NVIM_CONFIG_SOURCE does not exist."
    exit 1
fi
