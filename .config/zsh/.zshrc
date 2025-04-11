# Set Font
export TERMINAL_FONT="JetBrainsMono Nerd Font"

# Load completion
autoload -Uz compinit && compinit

# Load externalized plugin sources
if [ -f "$HOME/.dotfiles/.config/zsh/sources" ]; then
    source "$HOME/.dotfiles/.config/zsh/sources"
fi
