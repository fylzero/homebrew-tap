#!/usr/bin/env bash
# Points each cask at its app's latest GitHub release: the version from the tag,
# the sha256 from the macOS DMG's asset digest (downloaded and hashed if the
# API has no digest). Leaves a cask alone when it is already current.
#
#   scripts/bump-casks.sh             # every cask
#   scripts/bump-casks.sh lockshot    # just one
set -euo pipefail
cd "$(dirname "$0")/.."

# Written for the bash 3.2 macOS ships, so no associative arrays.
app_name() {
  case $1 in
    dispatch) echo Dispatch ;;
    lockshot) echo Lockshot ;;
    recon) echo Recon ;;
    shipyard) echo Shipyard ;;
    *) echo "unknown cask: $1" >&2; return 1 ;;
  esac
}

[[ $# -gt 0 ]] || set -- dispatch lockshot recon shipyard

for token in "$@"; do
  name=$(app_name "$token")
  cask="Casks/$token.rb"
  asset="$name-macos-arm64.dmg"

  read -r tag digest < <(gh api "repos/fylzero/$token/releases/latest" \
    --jq "[.tag_name, ((.assets[] | select(.name == \"$asset\") | .digest) // \"none\")] | @tsv")
  version=${tag#v}

  if [[ $digest == none ]]; then
    echo "$token $version: no $asset in the latest release, skipping"
    continue
  fi
  current=$(sed -nE 's/^  version "(.*)"$/\1/p' "$cask")
  if [[ $current == "$version" ]]; then
    echo "$token: already $version"
    continue
  fi

  sha=${digest#sha256:}
  if [[ ! $sha =~ ^[0-9a-f]{64}$ ]]; then
    sha=$(curl -fsSL "https://github.com/fylzero/$token/releases/download/$tag/$asset" | shasum -a 256 | cut -d' ' -f1)
  fi

  sed -i.bak -E "s/^  version \".*\"$/  version \"$version\"/; s/^  sha256 \".*\"$/  sha256 \"$sha\"/" "$cask"
  rm "$cask.bak"
  echo "$token: $current -> $version"
done
