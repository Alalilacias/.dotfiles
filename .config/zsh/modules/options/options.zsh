# History
HISTFILE="$HOME/.dotfiles/.config/zsh/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Navigation
setopt auto_cd

# Usability
setopt correct
setopt extended_glob
