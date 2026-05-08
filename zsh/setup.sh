#!/usr/bin/env zsh

#set -e
#set -o pipefail

if [ ! -d ~/.zplug ]; then
  echo "Installing zplug"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

echo "Installing zplug deps"
. ~/.zshrc
zplug install

if [ ! -f ~/.fzf.zsh ]; then
  echo "Installing fzf"
  $(brew --prefix)/opt/fzf/install --all
fi
