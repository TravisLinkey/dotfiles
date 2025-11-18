
## Docket workspaces
alias api="cd apps/docket-api"
alias be="cd apps/docket-backend"
alias dk="cd ~/Projects/ServiceCore/workspace/docket"
alias dp="cd ~/Projects/ServiceCore/workspace/docket-platform"
alias sc="cd ~/Projects/ServiceCore/workspace/Survcart"


alias dev="npm run dev"
alias stage="npm run stage"
alias docs="npm run docs"
alias diff="bash ~/dotfiles/zsh/aliases/scripts/bug-template.sh"


alias init:be="bash ~/dotfiles/zsh/aliases/scripts/copy_env.sh"
alias init:fe="bash ~/dotfiles/zsh/aliases/scripts/refresh_local.sh"
alias init:schema="docker exec -it docket-firebase-1 node functions/utils/schema.js"
alias seed:fe="docker compose exec firebase node functions/utils/schema.js"
