#!/usr/bin/env zsh

alias reload!='rehash; . ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias tree='tree --dirsfirst'

alias chown-myself="chown $USER:$USER"

alias history="history -i 1"
alias htop="sudo htop"
alias zsh_stats="fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n20"

# alias nvim="MIX_ENV=test nvim"
alias vim="nvim"

alias difff="diff-so-fancy"

alias tailf="tail -f"
alias taillog="tail -f log/development.log"

# alias tx="tmux"
# alias txl="tmux list-sessions"
# alias txa="tmux attach -t "

######################################################
#              FILES/DIRS MANIPULATION               #
######################################################

alias cpr="cp -R"
alias rmr="rm -fR"
# File size
alias fs="stat -f '%z bytes'"
alias df="gdf -h"
alias du="gdu -bh"
alias ll="ls -l"

# Intuitive map function
# Source: https://github.com/mathiasbynens/dotfiles
#
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# For eachdir
alias eachdir=". eachdir"

# Recursively delete `.DS_Store` files
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"


######################################################
#                       NET                          #
######################################################

# IP addresses
alias dnsip="dig +short myip.opendns.com @resolver1.opendns.com"
alias remoteip="curl https://api.ipify.org"
alias whois="whois -h whois-servers.net"
alias geoip="curl http://www.telize.com/geoip"

# SSH
alias kill_ssh="killall ssh; rm /tmp/ssh_mux_*"
alias ssh_key="cat ~/.ssh/id_rsa.pub | pbcopy"

# # Alias HTTP verbs
# # One of @janmoesen’s ProTip™s
# # Source: https://github.com/mathiasbynens/dotfiles
# for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#   alias "$method"="curl -X $method"
# done

alias file_server="python3 -m http.server 8888"
alias tp="telepresence"

######################################################
#                       OTHER                        #
######################################################

alias cask='brew cask'
alias service='brew services'

alias be='bundle exec'
alias rspec='bundle exec rspec'
alias tilt='/usr/local/bin/tilt'

alias pss='ps aux | grep '

# Stopwatch
# Source: https://github.com/mathiasbynens/dotfiles
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Restart postgresql. Always remove postmaster.pid to avoid annoying errors.
alias restart_postgres='rm /usr/local/var/postgres/postmaster.pid; brew services restart postgres'

# Turn on LG TV
# alias tv_on='wakeonlan "58:FD:B1:70:12:4A"'

# Neovim and elixir
# alias tmux2="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket2 tmux"
# alias tmux3="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket3 tmux"
# alias tmux4="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket4 tmux"
# alias tmux5="NVIM_LISTEN_ADDRESS=/tmp/nvimsocket5 tmux"

######################################################
#                       Docker                       #
######################################################

alias kb=kubectl

######################################################
#                       MISC                         #
######################################################


# Interactive move
imv() {
  local src dst
  for src; do
    [[ -e $src ]] || { print -u2 "$src does not exist"; continue }
    dst=$src
    vared dst
    [[ $src != $dst ]] && mkdir -p $dst:h && mv -n $src $dst
  done
}

# Find shorthand
# Source: https://github.com/paulirish/dotfiles
f() {
    find . -name "$1"
}

# Kitty ssh
# mosh "$@" -- tmux new -As mosh-session
ssht () {
  kitty +kitten ssh "$@"
}

# Shorthand to get info and dependent upon at the same time
brew_info() {
  brew info $1 && echo "\nUsed by:" && brew uses --installed $1
}

# Use brew's openssl, because apple's can't open PSD2 certs
cert() {
  /usr/local/Cellar/openssl*/1*/bin/openssl x509 -in "$1" -text -noout
}

# Cat binary file as hex
cat_hex() {
  xxd -p "$1" | tr -d '\n'
}

base64() {
  ruby -e "require 'base64'; puts Base64.urlsafe_encode64(ARGV.first || STDIN.read.to_s)"
}

# History shorthand
h() {
  if [[ -z "$@" ]]
  then
    history
  else
    history | ag "$@"
  fi
}

# get gzipped size
gz() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# Create a new directory and enter it
mkd() {
  mkdir -p "$@" && cd "$@"
}


# Escape UTF-8 characters into their 3-byte format
escape() {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
  echo # newline
}

# Decode \x{ABCD}-style Unicode escape sequences
unidecode() {
  perl -e "binmode(STDOUT, ':utf8'); print \"$@\""
  echo # newline
}

# Shorthard to create zip archive
compress() {
  zip -r "$1.zip" $@
}

# Extract archives
extract() {
   if [ -f $1 ] ; then
     case $1 in
      *.tar.bz2)  
        tar xvjf $1   
        ;;
      *.tar.gz)  
        tar xvzf $1   
        ;;
      *.bz2)    
        bunzip2 $1   
        ;;
      *.rar)
        unrar x $1   
        ;;
      *.gz)
        gunzip $1    
        ;;
      *.tar)
        tar xvf $1   
        ;;
      *.tbz2)
        tar xvjf $1   
        ;;
      *.tgz)
        tar xvzf $1   
        ;;
      *.zip)
        unzip $1    
        ;;
      *.Z)
        uncompress $1  
        ;;
      *.7z)
        7z x $1     
        ;;
      *) 
        echo "'$1' cannot be extracted via extract" 
        ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Format files
format() {
   if [ -f $1 ] ; then
     case $1 in
      *.html)  
        tidy -mi -html -wrap 0 $1
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Repeat command N times
# loop 5 <command>
function loop() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

# Helper to use ruby in CLI
rb() {
  ruby -e "puts $1"
}

# Split input by separator
# echo $PATH | split_by :
split_by() {
  ruby -e "puts STDIN.read.split('$1')"
}

