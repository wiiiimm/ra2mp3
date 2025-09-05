#!/bin/bash

# Script to update Homebrew tap for ra2mp3
# Used locally or in CI/CD pipelines

set -e

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 1.4.1"
  exit 1
fi

echo "Updating Homebrew tap for ra2mp3 version $VERSION..."

# Check for GitHub token
if [ -z "$GITHUB_TOKEN" ] && [ -z "$GH_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN or GH_TOKEN environment variable is required"
  exit 1
fi

TOKEN=${GITHUB_TOKEN:-$GH_TOKEN}

# Configure git
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Clone the tap repository
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"
git clone https://x-access-token:${TOKEN}@github.com/wiiiimm/homebrew-tap.git tap-repo
cd tap-repo

# Create or update formula
FORMULA="Formula/ra2mp3.rb"
if [ ! -f "$FORMULA" ]; then
  echo "Creating new formula..."
  mkdir -p Formula
  cat > "$FORMULA" << 'EOF'
class Ra2mp3 < Formula
  desc "Convert RealAudio (.ra/.ram/.rm) files to MP3 format using FFmpeg"
  homepage "https://github.com/wiiiimm/ra2mp3"
  url "https://github.com/wiiiimm/ra2mp3/archive/v0.0.0.tar.gz"
  sha256 "placeholder"
  license "MIT"

  depends_on "ffmpeg"

  def install
    bin.install "ra2mp3"
  end

  test do
    system "#{bin}/ra2mp3", "--version"
  end
end
EOF
fi

# Calculate SHA256 for the release tarball
RELEASE_URL="https://github.com/wiiiimm/ra2mp3/archive/v${VERSION}.tar.gz"
echo "Downloading from: $RELEASE_URL"

curl -L -o release.tar.gz "$RELEASE_URL"
if [[ "$OSTYPE" == "darwin"* ]]; then
  SHA256=$(shasum -a 256 release.tar.gz | cut -d' ' -f1)
else
  SHA256=$(sha256sum release.tar.gz | cut -d' ' -f1)
fi

echo "SHA256: $SHA256"

# Update the formula
sed -i.bak -E "s|url \"https://github.com/wiiiimm/ra2mp3/archive/v[0-9.]+\.tar\.gz\"|url \"https://github.com/wiiiimm/ra2mp3/archive/v${VERSION}.tar.gz\"|" "$FORMULA"
sed -i.bak -E "s|sha256 \"[a-f0-9]*\"|sha256 \"${SHA256}\"|" "$FORMULA"
rm -f "${FORMULA}.bak"

# Check if changes were made
if git diff --quiet; then
  echo "No changes to formula (already up to date)"
  exit 0
fi

# Commit and push
git add "$FORMULA"
git commit -m "Update ra2mp3 to ${VERSION}"
git push origin main

echo "✅ Homebrew formula updated successfully"

# Cleanup
cd /
rm -rf "$TEMP_DIR"