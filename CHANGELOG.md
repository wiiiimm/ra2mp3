# [1.3.0](https://github.com/wiiiimm/ra2mp3/compare/v1.2.1...v1.3.0) (2025-08-31)


### Features

* improve release automation and script quality based on code review ([c839fe8](https://github.com/wiiiimm/ra2mp3/commit/c839fe81ad54bb3a0a114853ffe640dd45fc2318))

## [1.2.1](https://github.com/wiiiimm/ra2mp3/compare/v1.2.0...v1.2.1) (2025-08-31)


### Bug Fixes

* correct dates in CHANGELOG.md to 2025 ([cc22e53](https://github.com/wiiiimm/ra2mp3/commit/cc22e53dc296cc993855c35349447415abad1517))

# [1.2.0](https://github.com/wiiiimm/ra2mp3/compare/v1.1.0...v1.2.0) (2025-08-31)


### Features

* add semantic release workflows and pr title management ([3c0a8c5](https://github.com/wiiiimm/ra2mp3/commit/3c0a8c580fbf70a89b32e0d27f67ef99a793b0d2))

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Semantic release automation with changelog generation
- PR title manager workflow for conventional commits
- Automated version bumping and GitHub releases
- Support for `.ram` and `.rm` RealAudio file extensions
- Comprehensive project documentation in AGENTS.md

### Changed
- Updated to version 1.2.0 with enhanced file format support
- Improved workflow automation for development

## [1.1.0] - 2025-08-31

### Added
- Command-line options: `--input`, `--output`, `--overwrite`, `--dry-run`
- Help (`-h`, `--help`) and version (`-v`, `--version`) flags
- Enhanced error handling and progress tracking
- Improved testing workflow with dedicated test directories

### Changed
- Renamed main script from `convert_ra_to_mp3.sh` to `ra2mp3`
- Updated installation scripts for better user experience
- Improved documentation and usage instructions

### Fixed
- Better handling of nested directory structures
- More robust file processing with error recovery

## [1.0.0] - 2025-08-31

### Added
- Initial release of ra2mp3 conversion tool
- Support for `.ra` RealAudio file conversion to MP3
- Cross-platform installation scripts (macOS and Linux)
- Automatic dependency management (FFmpeg, Homebrew)
- Recursive directory processing
- Color-coded output with progress indicators
- MIT license
- Comprehensive README with installation and usage instructions

### Features
- Batch conversion of RealAudio files
- Preserves directory structure in output
- Handles Unicode characters in filenames
- Automatic FFmpeg installation via package managers
- Cross-platform compatibility (macOS, Linux)

[Unreleased]: https://github.com/wiiiimm/ra2mp3/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/wiiiimm/ra2mp3/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/wiiiimm/ra2mp3/releases/tag/v1.0.0
