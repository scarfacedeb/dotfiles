# Install version manager
brew install chruby ruby-install

DEFAULT_VERSION=$(cat ruby/ruby-version)

ruby-install $DEFAULT_VERSION
ruby-install 2.7.6

chruby $DEFAULT_VERSION

touch ~/.gem/ruby/$DEFAULT_VERSION/gems/.lsp_ruby_root
touch ~/.gem/ruby/2.7.6/gems/.lsp_ruby_root

gem install solargraph solargraph-rails:1.0.0.pre.1 rubocop rubocop-rspec rubocop-performance rubocop-rails
solargraph download-core
