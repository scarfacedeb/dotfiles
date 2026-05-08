#!/usr/bin/env zsh

#set -e
#set -o pipefail

# Install version manager
brew install chruby ruby-install

# Fetch the latest stable Ruby version
ruby-install --update > /dev/null
LATEST_VERSION=$(ruby-install | awk '/  ruby:/{found=1; next} found && /^  [a-z]/{exit} found && NF{last=$1} END{print last}')

SCRIPT_DIR=${0:a:h}
echo "ruby-$LATEST_VERSION" > "$SCRIPT_DIR/ruby-version"

DEFAULT_GEMS="rubocop rubocop-rspec rubocop-performance rubocop-rails"

echo "Installing Ruby $LATEST_VERSION"
ruby-install --cleanup --no-reinstall ruby $LATEST_VERSION

. $BREW_PREFIX/opt/chruby/share/chruby/chruby.sh
chruby $LATEST_VERSION

echo "Installing default gems for $LATEST_VERSION"
gem install --conservative $DEFAULT_GEMS

