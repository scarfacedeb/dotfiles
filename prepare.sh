#!/usr/bin/env zsh

# Run this on the OLD machine before migrating to a new one.
# It exports your GPG private key so git-secret files can be decrypted on the new machine.

set -e

KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | awk '/^sec/{split($2,a,"/"); print a[2]; exit}')

if [ -z "$KEY_ID" ]; then
  echo "No secret GPG keys found."
  exit 1
fi

echo "Using GPG key: $KEY_ID"

OUTPUT=~/Desktop/gpg.asc
gpg --export-secret-keys --armor "$KEY_ID" > "$OUTPUT"

echo ""
echo "Exported to $OUTPUT"
echo "Transfer it securely to the new machine (AirDrop, 1Password note, etc.),"
echo "place it at ~/Desktop/gpg.asc, then run ./setup.sh."
echo ""
echo "Remember to delete $OUTPUT from this machine once transferred."
