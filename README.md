# ra2mp3

A simple bash script to convert RealAudio (.ra) files to MP3 format using FFmpeg.

## Features

- Recursively finds and converts all `.ra` files in the current directory
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
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/convert_ra_to_mp3.sh
chmod +x convert_ra_to_mp3.sh

# Convert your files
./convert_ra_to_mp3.sh
```

**Linux:**
```bash
# Go to your directory with .ra files
cd /path/to/your/ra/files

# Download and run the installer
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_linux.sh | bash

# Download the converter script
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/convert_ra_to_mp3.sh
chmod +x convert_ra_to_mp3.sh

# Convert your files
./convert_ra_to_mp3.sh
```

### Manual Setup (All Platforms)
```bash
# Go to your directory with .ra files
cd /path/to/your/ra/files

# Download the script
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/convert_ra_to_mp3.sh
chmod +x convert_ra_to_mp3.sh

# Make sure ffmpeg is installed (see Prerequisites above)
# Then run the conversion
./convert_ra_to_mp3.sh
```

The converted MP3 files will be saved in a `./converted/` directory, maintaining the original folder structure.

## Example

```
your-music-folder/
├── album1/
│   ├── track1.ra
│   └── track2.ra
├── album2/
│   └── track3.ra
└── convert_ra_to_mp3.sh

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
└── convert_ra_to_mp3.sh
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

## Contributing

Issues and pull requests welcome! This is a simple tool but improvements are always appreciated.

## About RealAudio

RealAudio was a proprietary audio format developed by RealNetworks, popular in the late 1990s and early 2000s for streaming audio over dial-up connections. While largely obsolete today, you might encounter `.ra` files in old archives or legacy systems.