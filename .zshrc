[ -f ~/.flow-secrets ] && source ~/.flow-secrets

# aliases
for file in ~/dotfiles/zsh/aliases/*.zsh; do
  echo "[zsh] Sourcing ${file}"
  source "$file"
done

# Claude Code
export PATH="$HOME/.local/bin:$PATH"

export PATH="$PATH:$HOME/Projects/bash/workspace/git-diff-analyzer/bin"

goto() {
  local dest=$(bash ~/dotfiles/zsh/aliases/scripts/goto.sh $1)
  if [ $? -eq 0 ] && [ -d "$dest" ]; then
    cd "$dest"
  else
    echo "Failed to navigate to: $1" >&2
    return 1
  fi
}

# work
# alias chrome='/usr/bin/open -b com.google.Chrome --args --remote-debugging-port=9222'
alias chrome="/usr/bin/open -na 'Google Chrome' --args --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-debug-profile"

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

# openai key
[ -f ~/dotfiles/openai_env ] && source ~/dotfiles/openai_env


# Elixir
export PATH=$HOME//opt/homebrew/Cellar/erlang/28.0.1/lib/erlang/erts-16.0.1/bin:$PATH
export PATH=$HOME//opt/homebrew/bin:$PATH
alias kl="kill \$(lsof -ti:\$1)"

export PATH="$PATH:/Users/travislinkey/Projects/bash/workspace/git-diff-analyzer/bin"
