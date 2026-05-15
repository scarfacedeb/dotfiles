#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() {
  printf '==> %s\n' "$1"
}

warn() {
  printf 'WARN: %s\n' "$1" >&2
}

expand_home() {
  local path="$1"
  printf '%s\n' "${path/#\~/$HOME}"
}

clean_home_symlinks() {
  info "Cleaning broken dotfile symlinks"

  local link target
  find "$HOME" -maxdepth 1 -type l -print | while IFS= read -r link; do
    target="$(readlink "$link")"

    case "$target" in
      "$DOTFILES_DIR"/* | "$DOTFILES_DIR")
        if [ ! -e "$link" ]; then
          rm "$link"
          printf 'Removed %s\n' "$link"
        fi
        ;;
    esac
  done
}

ensure_dir() {
  local dir
  dir="$(expand_home "$1")"

  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    printf 'Created %s\n' "$dir"
  fi
}

link_file() {
  local target source target_dir
  target="$(expand_home "$1")"
  source="$DOTFILES_DIR/$2"
  target_dir="$(dirname "$target")"

  if [ ! -e "$source" ]; then
    warn "Skipping $target; source is missing: $source"
    return
  fi

  mkdir -p "$target_dir"

  if [ -L "$target" ]; then
    if [ "$(readlink "$target")" = "$source" ]; then
      printf 'Already linked %s\n' "$target"
      return
    fi

    rm "$target"
  elif [ -e "$target" ]; then
    warn "Skipping $target; a real file or directory already exists"
    return
  fi

  ln -s "$source" "$target"
  printf 'Linked %s -> %s\n' "$target" "$source"
}

main() {
  clean_home_symlinks

  info "Linking dotfiles"
  link_file ~/.gitconfig git/gitconfig
  link_file ~/.gitignore_global git/gitignore_global
  link_file ~/.ssh/config zsh/ssh_config

  link_file ~/.zshrc zsh/zshrc
  link_file ~/.zsh.d zsh/zsh.d
  link_file ~/.zsh.d/git.zsh git/aliases.zsh
  link_file ~/.zsh.d/catawiki.zsh cw/aliases.sh
  link_file ~/.tmux.conf zsh/tmux.conf
  link_file ~/.config/kitty zsh/kitty

  link_file ~/.config/nvim vim/config

  link_file ~/.ruby-version ruby/ruby-version
  link_file ~/.bundle/config ruby/bundle_config
  link_file ~/.rubocop.yml ruby/rubocop.yml

  link_file ~/.hammerspoon macos/hammerspoon

  link_file ~/.dotfiles/bin/nginx_tail cw/bin/nginx_tail

  info "Creating directories"
  ensure_dir ~/.git-templates
  ensure_dir ~/.cache/nvim/sessions
  ensure_dir ~/.cache/nvim/backup
  ensure_dir ~/.cache/nvim/swap
  ensure_dir ~/.cache/nvim/undo
}

main "$@"
