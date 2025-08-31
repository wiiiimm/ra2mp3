# AGENTS.md - ra2mp3 Project Memory & Instructions

## Project Overview

**ra2mp3** is a cross-platform bash script that converts RealAudio (.ra) files to MP3 format using FFmpeg. This project was created to help users migrate legacy audio files to a modern, widely-supported format.

### Current Status: v1.1.0 (Production Ready)
- ✅ Full feature implementation complete
- ✅ Cross-platform support (macOS/Linux) 
- ✅ Comprehensive testing with real RealAudio files
- ✅ Unicode and special character support
- ✅ Advanced command-line options

## Repository Structure

```
ra2mp3/
├── ra2mp3                 # Main conversion script (bash)
├── install_macos.sh       # macOS installer (Homebrew + FFmpeg)
├── install_linux.sh       # Linux installer (multi-distro support)
├── README.md              # User documentation
├── LICENSE                # MIT License
├── .gitignore             # Git ignore patterns
├── AGENTS.md              # This file - project memory/instructions
├── tests/                 # Test RealAudio files (gitignored)
└── converted/             # Output directory (gitignored)
```

## Core Features

### Main Script (`ra2mp3`)
- **Version:** 1.1.0
- **Language:** Bash with strict error handling (`set -euo pipefail`)
- **Dependencies:** FFmpeg with libmp3lame support
- **Encoding:** VBR quality 2 (~170-210 kbps)

### Command-Line Options
```bash
./ra2mp3 [OPTIONS]

Options:
  -i, --input DIR      Input directory to recursively search for .ra files (default: current directory)
  -o, --output DIR     Output directory for converted files (default: converted/)
  --overwrite          Overwrite existing MP3 files
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
- **Current:** 1.1.0
- **Update locations:** All 3 scripts (ra2mp3, install_macos.sh, install_linux.sh)
- **Git tags:** Create matching tag (e.g., `git tag v1.1.0`)

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
```
Brief description of change

Detailed explanation if needed:
- Bullet points for multiple changes
- Reference issue numbers if applicable

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Release Process
1. Update version in all 3 scripts
2. Update AGENTS.md if needed
3. Commit with descriptive message
4. Create git tag: `git tag vX.Y.Z`
5. Push everything: `git push && git push origin vX.Y.Z`

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

*Last updated: 2025-08-31 (v1.1.0)*
*Remember to update this file when making significant changes to the project.*