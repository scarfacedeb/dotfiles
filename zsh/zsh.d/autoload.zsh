#!/usr/bin/env zsh
# Autoload modules

# echo "autoload"

#skip_global_compinit=1

# autoload -Uz run-help
# autoload -Uz add-zsh-hook

autoload -Uz colors && colors
autoload -Uz compinit && compinit -u
autoload -Uz promptinit && promptinit -u

# Info for PROMPT
autoload vcs_info

# vim-surround
autoload -Uz surround
autoload -U modify-current-argument
autoload -z edit-command-line
