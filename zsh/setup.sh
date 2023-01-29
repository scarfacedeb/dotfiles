#!/usr/bin/env zsh

if [ ! -d ~/.zplug ]; then
  echo "Installing zplug"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

echo "Installing zplug deps"
. ~/.zplug/init.zsh
zplug install

echo "Installing fzf"
$(brew --prefix)/opt/fzf/install --all
