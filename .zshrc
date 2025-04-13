# aliases
alias Notes="cd ~/Documents/Obsidian/Travis/obsidian && nvim ."
alias dc="docker-compose"
alias dot="cd ~/dotfiles && nvim ."

# workspaces
alias dp="cd ~/Projects/ServiceCore/docket-platform/apps/docket-ach-polling"
alias be="cd ~/Projects/ServiceCore/docket-platform/apps/docket-backend"
alias api="cd ~/Projects/ServiceCore/docket-platform/apps/docket-api"
alias test="npm run test"
alias start="npm run start"

# work
alias chrome='/usr/bin/open -b com.google.Chrome --args --remote-debugging-port=9222'

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# setup java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/travislinkey/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
