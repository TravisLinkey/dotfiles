# Git Aliases

## Git basics
alias gs="git status"
alias gaa="git add ."
alias gcm="git commit -m"
alias gca="git commit --amend"

alias gco="git checkout"
alias gcb="git checkout -b"

alias gb="git branch"
alias gbr="git branch -D"

alias gpl="git pull"
alias gps="git push"

alias gl="git log --oneline --graph --decorate --all"

## Git worktree
alias gwta="git worktree add"
alias gwtl="git worktree list"
alias gwtr="git worktree remove"
alias gwtp="git worktree prune"

## Misc
alias gf="git fetch --all --prune"
alias gcp="git cherry-pick"

alias gwtc="bash ~/dotfiles/zsh/aliases/scripts/create_worktree.sh"

## Git config switching
alias gswitch="bash ~/dotfiles/zsh/aliases/scripts/git-switch.sh"
