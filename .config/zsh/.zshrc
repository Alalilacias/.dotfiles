# Enable syntax highlighting
if [ -d "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting" ]; then
    source "$HOME/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Enable autosuggestions
if [ -d "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions" ]; then
    source "$HOME/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# Set up aliases
if [ -f ~/.dotfiles/.config/zsh/aliases ]; then
    source ~/.dotfiles/.config/zsh/aliases
fi

# Set up functions. Due to my personal ignorance but thanks to the basic intellisense from nvim, it seems functions is a keyword, so pfunctions is the chosen answer. It stands for personal functions, as cfunctions for custom functions seemed improper due to possible confusion with the aclaimed language.
if [ -f ~/.dotfiles/.config/zsh/pfunctions ]; then
    source ~/.dotfiles/.config/zsh/pfunctions
fi

# Set up functions
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

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

# Load completion
autoload -Uz compinit && compinit

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
