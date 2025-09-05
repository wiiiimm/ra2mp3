#!/bin/bash

# Script to update version in all necessary files
# Used by semantic-release workflow

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

echo "Updating version to $VERSION..."

# Update version in the main script
sed -i.bak "s/VERSION=\"[^\"]*\"/VERSION=\"$VERSION\"/g" ra2mp3
rm -f ra2mp3.bak

# Update version in install scripts
sed -i.bak "s/VERSION=\"[^\"]*\"/VERSION=\"$VERSION\"/g" install_macos.sh
rm -f install_macos.sh.bak

sed -i.bak "s/VERSION=\"[^\"]*\"/VERSION=\"$VERSION\"/g" install_linux.sh
rm -f install_linux.sh.bak

echo "Version updated to $VERSION in all files"