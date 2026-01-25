#!/usr/bin/env bash
set -e

echo "🚀 Bootstrapping macOS..."

# Install Homebrew if needed
if ! command -v brew &> /dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add brew to PATH (Apple Silicon)
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo "📦 Installing Homebrew packages..."
brew update
brew bundle --file="$HOME/dotfiles/Brewfile"

echo "✅ Brew packages installed"
