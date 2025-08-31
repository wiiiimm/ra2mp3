# AGENTS.md - ra2mp3 Project Memory & Instructions

## Project Overview

**ra2mp3** is a cross-platform bash script that converts RealAudio (.ra/.ram/.rm) files to MP3 format using FFmpeg. This project was created to help users migrate legacy audio files to a modern, widely-supported format.

### Current Status: Production Ready
- ✅ Full feature implementation complete
- ✅ Cross-platform support (macOS/Linux) 
- ✅ Comprehensive testing with real RealAudio files
- ✅ Unicode and special character support
- ✅ Advanced command-line options with metadata preservation
- ✅ Semantic release automation and CI/CD workflows
- ✅ Automated changelog generation and PR title management
- ✅ Separated dry-run counters and improved metadata handling

**For current version and recent changes, see [CHANGELOG.md](./CHANGELOG.md)**

## Repository Structure

```
ra2mp3/
├── ra2mp3                 # Main conversion script (bash)
├── install_macos.sh       # macOS installer (Homebrew + FFmpeg)
├── install_linux.sh       # Linux installer (multi-distro support)
├── package.json           # NPM package config for semantic-release
├── CHANGELOG.md           # Generated changelog (semantic-release)
├── README.md              # User documentation
├── LICENSE                # MIT License
├── CLAUDE.md              # Minimal redirect to this file
├── .gitignore             # Git ignore patterns
├── .github/
│   ├── workflows/
│   │   ├── automated-release.yml    # Semantic release on main push
│   │   └── pr-title-manager.yml     # PR title automation
│   └── scripts/
│       └── normalize-pr-title.js    # PR title normalization logic
├── AGENTS.md              # This file - project memory/instructions
├── tests/                 # Test RealAudio files (gitignored)
└── converted/             # Output directory (gitignored)
```

## Core Features

### Main Script (`ra2mp3`)
- **Language:** Bash with strict error handling (`set -euo pipefail`)
- **Dependencies:** FFmpeg with libmp3lame support
- **Supported formats:** .ra, .ram, .rm (case-insensitive)
- **Encoding:** VBR quality 2 (~170-210 kbps)
- **Metadata:** Preserves original metadata by default, optional stripping with `--strip-metadata`

### Command-Line Options
```bash
./ra2mp3 [OPTIONS]

Options:
  -i, --input DIR      Input directory to recursively search for .ra files (default: current directory)
  -o, --output DIR     Output directory for converted files (default: converted/)
  --overwrite          Overwrite existing MP3 files
  --strip-metadata     Strip metadata for smaller file sizes (default: preserve metadata)
  --dry-run            Show what would be converted without actually converting
  -v, --version        Show version information
  -h, --help           Show this help message
```

### Key Behaviors
- **Recursive Processing:** Automatically processes all subdirectories
- **Directory Preservation:** Maintains original folder structure in output
- **Skip Existing:** By default, skips files that already exist (unless --overwrite)
- **Unicode Support:** Handles Chinese characters, spaces, parentheses in filenames
- **Progress Tracking:** Shows [X/Total] progress with color-coded status
- **Error Handling:** Continues processing even if individual files fail  
- **Metadata Preservation:** Preserves original file metadata (title, artist, etc.) by default
- **Counter Separation:** Dry-run mode shows separate counts for "would convert" vs "skipped" files

## Installation System

### Cross-Platform Installers
1. **macOS (`install_macos.sh`):**
   - Auto-installs Homebrew if missing
   - Installs FFmpeg via Homebrew
   - Handles both Intel and Apple Silicon Macs

2. **Linux (`install_linux.sh`):**
   - Auto-detects distribution (Ubuntu, Fedora, CentOS, Arch, openSUSE)
   - Uses appropriate package manager (apt, dnf, yum, pacman, zypper)
   - Provides helpful error messages with repository setup instructions

### User Installation Flow
```bash
# macOS
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_macos.sh | bash

# Linux  
curl -fsSL https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/install_linux.sh | bash

# Download converter
curl -O https://raw.githubusercontent.com/wiiiimm/ra2mp3/main/ra2mp3
chmod +x ra2mp3
```

## Development Workflow

### Version Management
- **Format:** Semantic versioning (MAJOR.MINOR.PATCH)
- **Automation:** semantic-release handles version bumping and git tags
- **Update locations:** All 3 scripts (ra2mp3, install_macos.sh, install_linux.sh) + package.json
- **Release process:** Automated via GitHub Actions on main branch push
- **Change tracking:** All releases and changes documented in [CHANGELOG.md](./CHANGELOG.md)

### Code Standards
- **Bash style:** Strict error handling, proper quoting, consistent indentation
- **Colors:** Use ANSI color codes for user feedback
- **Error messages:** Clear, actionable guidance for users
- **Logging:** Export LC_ALL and LANG for consistent locale handling

### Testing Protocol
1. **Unit Testing:** Test all command-line flags individually
2. **Integration Testing:** Test flag combinations
3. **Real Data Testing:** Use actual RealAudio files with Unicode names
4. **Cross-Platform:** Verify on both macOS and Linux
5. **Edge Cases:** Empty directories, existing files, permission issues

## Git Management

### Branch Strategy
- **main:** Production-ready code only
- **Feature branches:** For major changes (optional for small fixes)

### Commit Message Format
Follow [Conventional Commits](https://www.conventionalcommits.org/) specification:
```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:** feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert

**Examples:**
- `feat: add support for .ram and .rm file formats`
- `fix: handle unicode characters in filenames properly`
- `docs: update installation instructions for Linux`

### Automated Release Process
1. **PR Creation:** Titles automatically formatted to conventional commits
2. **Main Branch Push:** Triggers semantic-release workflow
3. **Version Calculation:** Based on commit types (feat = minor, fix = patch)
4. **CHANGELOG.md:** Generated automatically from commits
5. **GitHub Release:** Created with release notes
6. **Git Tags:** Applied automatically

### Manual Release Override
If needed for hotfixes:
1. Create conventional commit with appropriate type (fix:, feat:, etc.)
2. Push to main branch (semantic-release handles versioning and CHANGELOG.md automatically)

## GitHub Repository

- **URL:** https://github.com/wiiiimm/ra2mp3
- **Description:** "Convert RealAudio (.ra) files to MP3 format - bash script with installers for macOS and Linux"
- **Topics:** `audio-conversion`, `realaudio`, `mp3`, `ffmpeg`, `bash-script`, `macos`, `linux`, `command-line-tool`, `cross-platform`
- **License:** MIT

## File Patterns (.gitignore)

```
# Converted output directories  
converted/

# Test files and directories
test/
tests/
*.ra
*.mp3

# macOS
.DS_Store

# Temporary files
*.tmp
*.temp

# Log files
*.log
```

## Common Tasks

### Adding New Features
1. Update main script (`ra2mp3`)
2. Update help text in script
3. Test thoroughly with real files
4. Commit and push (version bumping and releases are automated)

### Bug Fixes
1. Identify issue and create test case
2. Fix in main script
3. Test fix with various scenarios
4. Commit and push (version bumping and releases are automated)

### Platform Support
- Adding new Linux distributions: Update `install_linux.sh`
- macOS changes: Update `install_macos.sh`
- Always test on actual target platforms

## Known Limitations

- **Windows:** Not directly supported (users need WSL)
- **FFmpeg dependency:** Required for all conversions
- **RealAudio formats:** Relies on FFmpeg's support
- **Large files:** No progress bar for individual file conversion
- **Parallel processing:** Single-threaded conversion

## Future Considerations

- **Quality options:** Could add --quality flag for different bitrates
- **Parallel processing:** Could add --jobs flag for concurrent conversions
- **Windows support:** Could create PowerShell version
- **Container:** Could create Docker image for consistent environment
- **CI/CD:** Could add automated testing on GitHub Actions

## Agent Guidelines

When working on this project:

1. **Always test changes** with actual RealAudio files before committing
2. **Maintain backward compatibility** - don't break existing usage patterns
3. **Update script help text** when adding features (versioning and releases are automated)
4. **Follow the established patterns** for error handling, user feedback, and code style
5. **Consider cross-platform implications** for any changes
6. **Use conventional commits** - semantic-release handles versioning and releases automatically
7. **Keep it simple** - this is a focused utility tool, not a complex application

---

**📋 For version history, recent changes, and release notes, see [CHANGELOG.md](./CHANGELOG.md)**

*This file contains static project architecture and development guidelines. Dynamic information like versions and changes are tracked automatically in CHANGELOG.md.*
