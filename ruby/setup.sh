#!/usr/bin/env zsh

# Install version manager
brew install chruby ruby-install

VERSIONS="2.7.7 3.2.0"
DEFAULT_GEMS="solargraph solargraph-rails:1.0.0.pre.1 rubocop rubocop-rspec rubocop-performance rubocop-rails"

for version in $VERSIONS; do 
  echo "Installing Ruby $version"
  ruby-install --cleanup --no-reinstall $version

  touch ~/.gem/ruby/$version/gems/.lsp_ruby_root
  . $BREW_PREFIX/opt/chruby/share/chruby/chruby.sh
  chruby $version

  echo "Installing default gems for $version"
  gem install --conservative $DEFAULT_GEMS

  echo "Setting up Ruby LSP for $version"
  solargraph download-core
  yard gems > /dev/null
done

