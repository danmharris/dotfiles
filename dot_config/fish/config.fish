# Config
set -xg EDITOR nvim
set fish_greeting
set -xga PATH ~/.npm-packages/bin
set -xgp PATH ~/.n/bin
set -xg N_PREFIX ~/.n

# Aliases
alias ll="ls -al"
alias gs="git status"
alias gc="git commit"
alias gps="git push"
alias gpl="git pull --rebase"

# Prompt
starship init fish | source
