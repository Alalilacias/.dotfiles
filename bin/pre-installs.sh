#!/usr/bin/env bash
#
# Author: Alalilacias
# Description: Installs apps critical for the functioning of the entire ecosystem. Unlikely to be used.
# Syntax: ./pre-installs.sh
# Version: 0.3

# Associative array of critical apps to check
declare -A CRITICAL_APPS=(
  ["git"]="git"
  ["kitty"]="kitty"
  ["nvim"]="nvim"
  ["ripgrep"]="rg"
  ["build-essential"]="gcc"
  ["luarocks"]="luarocks"
  ["fd-find"]="fdfind"
  ["fzf"]="fzf"
  ["lazygit"]="lazygit"
  ["node"]="node"
)

# Function to check if an app is installed
is_app_installed() {
  local package="$1"
  local executable="${CRITICAL_APPS[$package]}"
  command -v "$executable" &>/dev/null
}

# Function to install an app
install_app() {
  local package="$1"
  echo "Installing $package..."

  case "$package" in
  "nvim")
    echo "Installing Neovim (unstable branch)..."
    if ! grep -q "neovim-ppa" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
      sudo add-apt-repository -y ppa:neovim-ppa/unstable
    fi
    sudo apt-get update
    sudo apt-get install -y neovim
    ;;

  "lazygit")
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit.tar.gz lazygit
    ;;

  "node")
    if [ -d "$HOME/.dotfiles/submodules/zsh-nvm" ]; then
      source "$HOME/.dotfiles/submodules/zsh-nvm/zsh-nvm.plugin.zsh"
    else
      echo "zsh-nvm plugin not found"
      exit 1
    fi

    if is_app_installed "nvm"; then
      echo "Installing latest Node.js LTS via NVM..."
      nvm install --lts
      nvm use --lts
      nvm alias default lts/*

      echo "Node.js installation complete."
    else
      echo "zsh-nvm plugin not found, please install it."
    fi
    ;;

  *)
    if command -v apt-get &>/dev/null; then
      sudo apt-get update
      sudo apt-get install -y "$package"
    else
      echo "Unsupported package manager. Please install $package manually."
      exit 1
    fi
    ;;
  esac
}

# Loop through critical apps array, check if installed, install if not.
for package in "${!CRITICAL_APPS[@]}"; do
  if is_app_installed "$package"; then
    echo "${CRITICAL_APPS[$package]} is already installed."
  else
    install_app "$package"
  fi
done

# Notify user of script termination
echo "Pre-installation complete. All critical apps installed."
