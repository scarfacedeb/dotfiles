#!/usr/bin/env zsh

# ========== Base ============

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Default: *?_-.[]~=/&;!#$%^(){}<>
export WORDCHARS='*?_!#$%^'

ulimit -n 10240

# ========== EDITOR/PAGER/etc ============

export EDITOR='nvim'
export BROWSER='open'

export PAGER="less -X"
export MANPAGER="$PAGER" # Don’t clear the screen after quitting a manual page

# Support 256 colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
# export BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# export BAT_THEME=OneHalfDark
export BAT_THEME=base16

# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# -j.5 to position search in the center
export LESS='-F -i -M -R -S -w -X -z-4 -j.3'

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
# if (( $#commands[(i)lesspipe(|.sh)] )); then
#   export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
# fi

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto"

# See FZF vars in ./fzf.zsh


# ========== History ============

export HISTSIZE=1000000000000000
export SAVEHIST=$HISTSIZE
export HISTFILESIZE=
export HISTFILE=~/.zsh_history

# ========== Dev ============

export PATH="$HOME/.dotfiles/bin:$PATH"

typeset -U PATH # remove duplicate entries

# PATHs
#export JAVA_HOME=$(/usr/libexec/java_home)
export GOPATH="$HOME/src/go"
#export RUST_PATH="$HOME/.cargo/bin"
# export NODE_PACKAGES_PATH="$HOME/.asdf/installs/nodejs/12.8.1/.npm/lib/node_modules/"

# Enable history in iex
# export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_drop '[\"recompile\"]'"

# Neovim remote server to make `open` command work in IEx
# export NVIM_LISTEN_ADDRESS=${NVIM_LISTEN_ADDRESS:-"/tmp/nvimsocket"}
# export ELIXIR_EDITOR="nvr +__LINE__ __FILE__"

# To override default values in config/dev.exs
# export POSTGRES_USER=scarfacedeb
# export POSTGRES_PORT=5432

# More heap
# export JRUBY_OPTS='--dev -J-Xmx1024m'
# export DISABLE_SPRING=1

# ========== Extra ============
#
# Less frequent brew update on brew install (Once a week)
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Remove delay to switch to VI mode in zsh
export KEYTIMEOUT=1
