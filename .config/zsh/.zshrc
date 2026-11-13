# Set Font
export TERMINAL_FONT="JetBrainsMono Nerd Font"

# Own completions (e.g. install_dotfiles). Must be in fpath before compinit runs.
fpath=("$HOME/.dotfiles/.config/zsh/completions" $fpath)

# Load externalized plugin sources. zsh-autocomplete must be sourced before compinit and runs it itself.
if [ -f "$HOME/.dotfiles/.config/zsh/sources" ]; then
    source "$HOME/.dotfiles/.config/zsh/sources"
fi

# Fallback for when the zsh-autocomplete submodule is not checked out.
(( $+functions[compdef] )) || { autoload -Uz compinit && compinit; }

if [ -f "$HOME/.local/bin/env" ]; then
  . "$HOME/.local/bin/env"
fi
