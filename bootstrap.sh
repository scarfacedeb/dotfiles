#!/usr/bin/env zsh

set -e

DOTFILES_DIR=${0:a:h}

# ── SSH key ───────────────────────────────────────────────────────────────────
if [ ! -f ~/.ssh/id_rsa ]; then
  echo "Generating SSH key..."
  ssh-keygen -f ~/.ssh/id_rsa -N ""
  echo ""
  echo "Your public SSH key (add it to GitHub → https://github.com/settings/ssh/new):"
  echo ""
  cat ~/.ssh/id_rsa.pub
  echo ""
  read "?Press Enter after you have added the key to GitHub..."
fi

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ── git-secret (needed before ./install) ─────────────────────────────────────
if ! command -v git-secret &>/dev/null; then
  echo "Installing git-secret..."
  brew install git-secret
fi

# ── GPG key import ────────────────────────────────────────────────────────────
GPG_KEY_FILE=~/Desktop/gpg.asc
if [ -f "$GPG_KEY_FILE" ]; then
  echo "Importing GPG key from $GPG_KEY_FILE..."
  gpg --import "$GPG_KEY_FILE"
  rm -f "$GPG_KEY_FILE"
  echo "GPG key imported and file removed."
fi

# ── Decrypt secrets ───────────────────────────────────────────────────────────
echo "Revealing git-secret files..."
cd "$DOTFILES_DIR"
git secret reveal -f

# ── Homebrew bundle ───────────────────────────────────────────────────────────
echo "Installing Homebrew dependencies..."
brew bundle

# ── Dotfiles install ──────────────────────────────────────────────────────────
echo "Running dotfiles install..."
cd "$DOTFILES_DIR"
./install
