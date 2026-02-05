
## Docket workspaces
alias api="cd apps/docket-api"
alias be="cd apps/docket-backend"
alias cli="cd apps/docket-cli"
alias dk="cd ~/Projects/ServiceCore/workspace/docket"
alias dp="cd ~/Projects/ServiceCore/workspace/docket-platform"
alias da="cd ~/Projects/ServiceCore/workspace/Docket-Admin/"
alias dcp="cd ~/Projects/ServiceCore/workspace/Docket-Customer-Portal/"
alias sc="cd ~/Projects/ServiceCore/workspace/Survcart"


alias dev="npm run dev"
alias stage="npm run stage"
alias docs="npm run docs"
alias diff:master="bash ~/dotfiles/zsh/aliases/scripts/bug-template-master.sh"
alias diff:main="bash ~/dotfiles/zsh/aliases/scripts/bug-template-main.sh"


alias init:be="bash ~/dotfiles/zsh/aliases/scripts/copy_env.sh"
alias init:fe="bash ~/dotfiles/zsh/aliases/scripts/refresh_local.sh"
alias seed:fe="docker compose exec firebase node functions/utils/schema.js --team-id=u239ApF9t7myE9TVAWTy"

# NEW STUFF
alias gdr="~/dotfiles/zsh/aliases/scripts/diff_analyzer.sh"
alias gdr-t="~/dotfiles/zsh/aliases/scripts/diff_analyzer.sh --no-worktree"
alias gds="~/Projects/bash/workspace/git-diff-analyzer/bin/git-diff-summary.sh"
alias plan="bash ~/dotfiles/zsh/aliases/scripts/create_plan.sh"
alias cov="bash /Users/travislinkey/Projects/bash/workspace/coverage-creator/main.sh"
alias pr="npm run prettier:fix"
alias auth="npm run auth:create-service-account:dev 2>&1 | grep -E 'Key:|Secret:'"
