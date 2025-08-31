# ra2mp3

A simple bash script to convert RealAudio (.ra/.ram/.rm) files to MP3 format using FFmpeg.

> **📋 For current version, release notes, and recent changes, see [CHANGELOG.md](./CHANGELOG.md)**

## Features

- Recursively finds and converts all `.ra`/`.ram`/`.rm` files (case-insensitive)
- Preserves directory structure in the output
- Skips files that have already been converted
- Uses high-quality MP3 encoding (VBR quality 2)
- Progress feedback with clear status messages

## Prerequisites

- **FFmpeg** with libmp3lame support
- **bash** (included with macOS/Linux)
- **macOS/Linux** (Windows users can use WSL)

### Quick Installation

We provide automatic installers for both macOS and Linux:

**macOS:**
```bash
# Download and run the macOS installer
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_macos.sh | bash
```
This script will:
- Install Homebrew (if not already installed)
- Install FFmpeg via Homebrew
- Verify everything is working

**Linux:**
```bash
# Download and run the Linux installer
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_linux.sh | bash
```
This script will:
- Detect your Linux distribution (Ubuntu, Fedora, CentOS, Arch, etc.)
- Install FFmpeg using the appropriate package manager
- Verify everything is working

### Manual Installation

**macOS (Homebrew):**
```bash
# Install Homebrew first if you don't have it:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then install FFmpeg:
brew install ffmpeg
```

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install ffmpeg
```

**CentOS/RHEL:**
```bash
sudo yum install epel-release
sudo yum install ffmpeg
```

## Usage

### Quick Start

**macOS:**
```bash
# Go to your directory with .ra files
cd /path/to/your/ra/files

# Download and run the installer
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_macos.sh | bash

# Download the converter script
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/ra2mp3
chmod +x ra2mp3

# Convert your files
./ra2mp3
```

**Linux:**
```bash
# Go to your directory with .ra files
cd /path/to/your/ra/files

# Download and run the installer
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_linux.sh | bash

# Download the converter script
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/ra2mp3
chmod +x ra2mp3

# Convert your files
./ra2mp3
```

### Manual Setup (All Platforms)
```bash
# Go to your directory with .ra files
cd /path/to/your/ra/files

# Download the script
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/ra2mp3
chmod +x ra2mp3

# Make sure ffmpeg is installed (see Prerequisites above)
# Then run the conversion
./ra2mp3
```

The converted MP3 files will be saved in a `./converted/` directory, maintaining the original folder structure.

Supported input extensions: `.ra`, `.ram`, `.rm` (case-insensitive).

## Advanced Usage

The script supports several command-line options for more control:

```bash
./ra2mp3 [OPTIONS]

Options:
  -i, --input DIR      Input directory to recursively search for .ra files (default: current directory)
  -o, --output DIR     Output directory for converted files (default: converted/)
  --overwrite          Overwrite existing MP3 files (forces overwrite)
  --strip-metadata     Strip metadata for smaller file sizes (default: preserve metadata)
  --dry-run            Show what would be converted without actually converting
  -v, --version        Show version information
  -h, --help           Show this help message
```

### Examples

```bash
# Convert files from a specific directory
./ra2mp3 --input /path/to/music

# Save converted files to a specific location
./ra2mp3 --output /tmp/mp3s

# Overwrite existing MP3 files
./ra2mp3 --overwrite

# Strip metadata for smaller file sizes
./ra2mp3 --strip-metadata

# Preview what would be converted (dry run)
./ra2mp3 --dry-run

# Combine options
./ra2mp3 --input /old/music --output /new/mp3s --overwrite --dry-run
```

## Example

```
your-music-folder/
├── album1/
│   ├── track1.ra
│   └── track2.ra
├── album2/
│   └── track3.ra
└── ra2mp3

# After running the script:

your-music-folder/
├── album1/
│   ├── track1.ra
│   └── track2.ra
├── album2/
│   └── track3.ra
├── converted/
│   ├── album1/
│   │   ├── track1.mp3
│   │   └── track2.mp3
│   └── album2/
│       └── track3.mp3
└── ra2mp3
```

## Output Quality

The script uses FFmpeg's libmp3lame encoder with VBR quality setting 2, which provides excellent quality while keeping file sizes reasonable. This typically results in bitrates around 170-210 kbps.

## Error Handling

- Skips files that don't exist on disk
- Skips files that have already been converted
- Continues processing even if individual files fail to convert
- Uses `set -euo pipefail` for robust error handling

## License

MIT License - feel free to use, modify, and distribute as needed.

## Development

This project uses [Conventional Commits](https://www.conventionalcommits.org/) and [semantic-release](https://semantic-release.gitbook.io/) for automated versioning and releases.

### Semantic Release
- Automatic version bumping based on commit messages
- Automated CHANGELOG.md generation
- GitHub releases with release notes
- Follows semantic versioning (MAJOR.MINOR.PATCH)

### Pull Request Guidelines
- PR titles are automatically formatted to conventional commit format
- Use conventional commit types: `feat:`, `fix:`, `docs:`, `chore:`, etc.
- Breaking changes should include `!` or `BREAKING CHANGE:` in commit message
- All PRs are automatically formatted to conventional commit format

### Contributing
Issues and pull requests welcome! This project includes automated workflows for:
- PR title formatting and validation
- Automated releases and changelog generation
- Code quality checks

When contributing:
- Use conventional commit messages (feat:, fix:, docs:, etc.)
- PR titles are automatically formatted
- Releases are automated based on commit types
- See [CHANGELOG.md](./CHANGELOG.md) for release history

## About RealAudio

RealAudio was a proprietary audio format developed by RealNetworks, popular in the late 1990s and early 2000s for streaming audio over dial-up connections. While largely obsolete today, you might encounter `.ra` files in old archives or legacy systems.
