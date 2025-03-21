# Set Font
export TERMINAL_FONT="JetBrainsMono Nerd Font"

# Load completion
autoload -Uz compinit && compinit

# Load externalized plugin sources
if [ -f "$HOME/.dotfiles/.config/zsh/sources" ]; then
    source "$HOME/.dotfiles/.config/zsh/sources"
fi

# Enable history
HISTFILE="$HOME/.dotfiles/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Enable auto-cd
setopt auto_cd

# Enable correction
setopt correct

# Enable globbing
setopt extended_glob

# Enable Zprof
zmodload zsh/zprof

# Load version control info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats ' (%r:%b%u%c)'  # Include repository name
zstyle ':vcs_info:git:*' actionformats ' (%r:%b|%a%u%c)'  # Include repository name

# Set prompt to match system theme
if [ -n "$PS1" ]; then
    setopt prompt_subst
    PS1='%B%F{green}%n@%m%f %F{blue}%~%f%F{red}${vcs_info_msg_0_}%f%b %# '
fi

# fnm
FNM_PATH="/home/alalin/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/alalin/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
