#!/usr/bin/env zsh

# Sync repositories in ~/projects by default.
# Use `projects_sync.sh init` to fetch non-archived private repos from github.com/catawiki
# and select repos to clone or update.

PROJECTS_DIR="$HOME/projects"
ORG="catawiki"
PER_PAGE=100
MODE="${1:-sync}"

mkdir -p "$PROJECTS_DIR"

build_remote_repo_entries() {
  local all_repos=()
  local page=1
  local batch
  local line

  echo "Fetching repositories from $ORG..."

  while true; do
    batch=$(gh api "orgs/$ORG/repos?type=private&per_page=$PER_PAGE&page=$page" \
      --jq '.[] | select(.archived | not) | [.name, ((.language // "unknown") | ascii_downcase), .ssh_url] | @tsv')
    [[ -z "$batch" ]] && break

    while IFS= read -r line; do
      all_repos+=("$line")
    done <<< "$batch"

    (( page++ ))
  done

  printf '%s\n' "${(@o)all_repos}"
}

build_local_repo_entries() {
  local repo_dirs=()
  local dir
  local repo_name

  for dir in "$PROJECTS_DIR"/*; do
    [[ -d "$dir/.git" ]] || continue
    repo_name="${dir:t}"
    repo_dirs+=("${repo_name}"$'\t'"local"$'\t'"$dir")
  done

  printf '%s\n' "${(@o)repo_dirs}"
}

if [[ "$MODE" == "init" ]]; then
  repo_entries=("${(@f)$(build_remote_repo_entries)}")

  if [[ ${#repo_entries[@]} -eq 0 ]]; then
    echo "No repositories found."
    exit 0
  fi

  display_entries=()
  start_actions=("first")

  for entry in "${repo_entries[@]}"; do
    IFS=$'\t' read -r repo_name language ssh_url <<< "$entry"
    display_entries+=("${repo_name} (${language})"$'\t'"${repo_name}"$'\t'"${ssh_url}")

    if [[ -d "$PROJECTS_DIR/$repo_name/.git" ]]; then
      start_actions+=("select")
    fi

    if [[ "$entry" != "${repo_entries[-1]}" ]]; then
      start_actions+=("down")
    fi
  done

  fzf_bind=()
  if [[ ${#start_actions[@]} -gt 1 ]]; then
    fzf_bind=(--bind "start:${(j:+:)start_actions}")
  fi

  selected=$(printf '%s\n' "${display_entries[@]}" | fzf \
    --multi \
    --delimiter=$'\t' \
    --with-nth=1 \
    "${fzf_bind[@]}" \
    --prompt "Select repos to init (Tab) > " \
    --header "Repos from $ORG — existing clones pre-selected" \
    --height=80% \
    --layout=reverse)

  [[ -z "$selected" ]] && echo "Nothing selected, aborting." && exit 0

  echo ""
  while IFS= read -r selected_entry; do
    IFS=$'\t' read -r display_name repo_name ssh_url <<< "$selected_entry"

    dest="$PROJECTS_DIR/$repo_name"
    if [[ -d "$dest/.git" ]]; then
      echo "  ↻ $repo_name (pulling)"
      git -C "$dest" pull --ff-only --quiet
    else
      echo "  ↓ $repo_name (cloning)"
      git clone --quiet "$ssh_url" "$dest"
    fi
  done <<< "$selected"
else
  if [[ "$MODE" != "sync" ]]; then
    echo "Usage: $(basename "$0") [init]"
    exit 1
  fi

  repo_entries=("${(@f)$(build_local_repo_entries)}")

  if [[ ${#repo_entries[@]} -eq 0 ]]; then
    echo "No local git repositories found in $PROJECTS_DIR."
    echo "Run $(basename "$0") init to fetch the org repo list."
    exit 0
  fi

  echo ""
  for selected_entry in "${repo_entries[@]}"; do
    IFS=$'\t' read -r repo_name source dest <<< "$selected_entry"
    echo "  ↻ $repo_name (pulling)"
    git -C "$dest" pull --ff-only --quiet
  done
fi

echo "Done."
