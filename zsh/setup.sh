#!/usr/bin/env zsh

if [ ! -d ~/.zplug ]; then
  echo "Installing zplug"
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

. ~/.zplug/init.zsh
zplug install
