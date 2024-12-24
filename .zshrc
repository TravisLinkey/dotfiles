alias Notes="cd ~/Documents/Obsidian/Travis/obsidian && nvim ."
alias dot="cd ~/dotfiles && nvim ."


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
