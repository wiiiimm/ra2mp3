# AGENTS.md - ra2mp3 Project Memory & Instructions

## Project Overview

**ra2mp3** is a cross-platform bash script that converts RealAudio (.ra/.ram/.rm) files to MP3 format using FFmpeg. This project was created to help users migrate legacy audio files to a modern, widely-supported format.

### Current Status: v1.3.0 (Production Ready)
- ✅ Full feature implementation complete
- ✅ Cross-platform support (macOS/Linux) 
- ✅ Comprehensive testing with real RealAudio files
- ✅ Unicode and special character support
- ✅ Advanced command-line options with metadata preservation
- ✅ Semantic release automation and CI/CD workflows
- ✅ Automated changelog generation and PR title management
- ✅ Separated dry-run counters and improved metadata handling

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
- **Version:** 1.3.0
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
- **Current:** 1.3.0
- **Automation:** semantic-release handles version bumping and git tags
- **Update locations:** All 3 scripts (ra2mp3, install_macos.sh, install_linux.sh) + package.json
- **Release process:** Automated via GitHub Actions on main branch push
- **Recent improvements:** Fixed version synchronization issues - all files now properly updated by semantic-release

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
1. Update version in all 3 scripts + package.json
2. Update CHANGELOG.md manually
3. Create conventional commit
4. Push to main branch (triggers automated release)

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
3. Update README.md examples
4. Test thoroughly with real files
5. Update version numbers
6. Commit, tag, and push

### Bug Fixes
1. Identify issue and create test case
2. Fix in main script
3. Test fix with various scenarios
4. Update patch version (X.Y.Z+1)
5. Commit and push

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
3. **Update all documentation** when adding features (script help, README, this file)
4. **Follow the established patterns** for error handling, user feedback, and code style
5. **Consider cross-platform implications** for any changes
6. **Version bumps require updating all 3 scripts** and creating git tags
7. **Keep it simple** - this is a focused utility tool, not a complex application

---

*Last updated: 2025-08-31 (v1.3.0)*
*Remember to update this file when making significant changes to the project.*

## Recent Changes (v1.3.0)

### Metadata Handling Improvements
- **Breaking Change:** Default behavior now preserves original file metadata
- **New Flag:** `--strip-metadata` to strip metadata for smaller file sizes
- **FFmpeg Arguments:** Uses `-map_metadata 0` by default, `-map_metadata -1` with flag
- **User Impact:** Better preservation of title, artist, album info from RealAudio files

### Counter System Enhancements  
- **Dry-Run Mode:** Separated "would_convert" count from "skipped" count
- **Status Display:** Clear distinction between files that would be processed vs already exist
- **Summary Output:** More accurate reporting in both dry-run and normal modes

### Release Process Fixes
- **Version Synchronization:** Fixed semantic-release to update all script files properly
- **Workflow Improvements:** Enhanced PR title normalization and case preservation
- **Automation Quality:** Removed blocking [skip ci] logic that was preventing releases
