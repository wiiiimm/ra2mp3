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

## [1.1.0] - 2023-XX-XX

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

## [1.0.0] - 2023-XX-XX

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