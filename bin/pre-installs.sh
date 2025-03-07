#!/usr/bin/env bash
#
# Author: Alalilacias
# Description: Installs apps critical for the functioning of the entire ecosystem. Unlikely to be used.
# Syntax: ./pre-installs.sh
# Version: 0.1

# Array of critical apps to check. Currently limited, might expand in the future.
CRITICAL_APPS=( "git" "kitty" "nvim" "ripgrep" "build-essential" "luacheck")  # Corrected array definition

# Function to check if an app is installed
is_app_installed() {
    	command -v "$1" &> /dev/null
}

# Function to install an app
install_app() {
    	# Define local app variable
    	local app="$1"
    	# Notify user
    	echo "Installing $app..."
	# Handle Neovim separately to ensure it's installed from the unstable branch
    	if [[ "$app" == "nvim" ]]; then
        	echo "Installing Neovim (unstable branch)..."
        
        	# Check if the PPA is already added
        	if ! grep -q "neovim-ppa" /etc/apt/sources.list /etc/apt/sources.list.d/* 2>/dev/null; then
            	sudo add-apt-repository -y ppa:neovim-ppa/unstable
        	fi
        
        	sudo apt-get update
        	sudo apt-get install -y neovim
        	return
    	fi
    	# Install based on os and package manager. Adapted to personal circumstances, modify if you're outside of Debian or Debian based distros.
    	case "$(uname -s)" in
        	Linux)
            		if command -v apt-get &> /dev/null; then
                		sudo apt-get update
                		sudo apt-get install -y "$app"
            		else
                		echo "Unsupported package manager. Please install $app manually."
                		exit 1
            		fi
            		;;
        	*)
            		echo "Unsupported operating system. Please install $app manually."
            		exit 1
            		;;
    	esac
}

# Loop through critical apps array, check if installed, install if not.
for app in "${CRITICAL_APPS[@]}"; do
    	if is_app_installed "$app"; then
        	echo "$app is already installed."
    	else
        	install_app "$app"
    	fi
done

# Notify user of script termination
echo "Pre-installation complete. All critical apps installed."
