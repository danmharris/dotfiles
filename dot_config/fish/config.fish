# Config
set -xg EDITOR nvim
set fish_greeting

# Aliases
alias ll="ls -al"
alias gs="git status"
alias gc="git commit"
alias gps="git push"
alias gpl="git pull --rebase"

# Prompt
starship init fish | source
