# Install version manager
brew install chruby ruby-install

ruby-install 3.0.3
ruby-install 2.6.6

touch ~/.gem/ruby/2.6.6/gems/.lsp_ruby_root
touch ~/.gem/ruby/3.0.3/gems/.lsp_ruby_root

# LSP
gem install solargraph rubocop rubocop-rspec rubocop-rails pry
solargraph download-core

# # Patch asdf to speed up shims
# asdf_dir="/usr/local/opt/asdf/libexec"
# asdf_exec="$asdf_dir/bin/private/asdf-exec"

# cp $asdf_exec $asdf_exec.bak
# wget https://github.com/danhper/asdf-exec/releases/download/v0.1.2/asdf-exec-darwin-x64 -O $asdf_exec

# sed -i.bak -e 's|exec $(asdf_dir)/bin/asdf exec|exec $(asdf_dir)/bin/private/asdf-exec|' "$asdf_dir/lib/commands/command-reshim.bash
