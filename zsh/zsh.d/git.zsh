#!/usr/bin/env zsh

# Core
alias g='git'
alias gs='git status -sb'

alias gclone='git clone'

# Commit (c)
alias gc='git commit -v'
alias gca='git commit -v --amend'
#alias gcm='git commit -m'

# Add (a)
alias ga='git add'
#alias gap='git add -p'

# Branches (b, ch)
alias gch='git checkout'
alias gb='git branch'
alias gbb='git switch'
alias gbc='git switch -c'
alias gr='git restore'
alias grmt='git remote -v'

# Push/pull (p, l)
alias gp='git push'
alias gl='git pull --rebase'
alias gf='git fetch'
alias gm='git merge --no-ff'

# Rebase (rb)
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gcherry='git cherry-pick'

# Reset (r)
# alias gr='git reset'
alias grh='git reset HEAD'
#alias grhh='git reset HEAD --hard'
#alias gdis='git checkout --'

# Diff (d)
alias gd='git diff'
alias gds='git diff --staged'

# Git diff after rebase
alias grbd='git range-diff @{u} @{1} @' 

# Log (log)
alias glog="git log -M --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %C(bold cyan)%cd %Cgreen(%cr)%Creset' --abbrev-commit --date=short"
alias gloga="git log -M --all --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %C(bold cyan)%cd %Cgreen(%cr)%Creset' --abbrev-commit --date=short"
alias glogv='git log --follow --stat --max-count=10'

alias gsh='git show'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias gcount='git shortlog -sn'

# Stash (st)
alias gst='git stash'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gsts='git stash -p save'
alias gstk='git stash push --keep-index'

# Misc
alias groot='cd $(git rev-parse --show-toplevel || echo ".")'

# Commits diff with master
glogd() {
  glog $1 --not ${2:-master}
}

# FZF

# Fuzzy git checkout
fgch() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# Fuzzy git show
fgsh() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git show $(echo "$commit" | sed "s/ .*//")
}

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# Output grouped log for stats
git-grouped-log () {
  while read -r -u 9 since name
  do
    until=$(date -j -v+1d -f '%Y-%m-%d' $since +%Y-%m-%d)

    echo "$since $name"
    echo

    GIT_PAGER=cat git log             \
      --no-merges                     \
      --committer="$name"             \
      --since="$since 00:00:00 +0000" \
      --until="$until 00:00:00 +0000" \
      --format='  * [%h] %s'

    echo
  done 9< <(git log --no-merges --format=$'%cd %cn' --date=short | sort --unique --reverse)
}

gtag() {
  git tag -f $1
  git push -f origin tags/$1
}

# take this repo and copy it to somewhere else minus the .git stuff.
# Source: https://github.com/paulirish/dotfiles
gitexport(){
  mkdir -p "$1"
  git archive master | tar -x -C "$1"
}
