autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats ' (%r:%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%r:%b|%a%u%c)'

if [ -n "$PS1" ]; then
  setopt prompt_subst
  PS1='%B%F{green}%n@%m%f %F{blue}%~%f%F{red}${vcs_info_msg_0_}%f%b %# '
fi
