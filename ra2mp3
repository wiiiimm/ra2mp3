#!/usr/bin/env bash
set -euo pipefail

VERSION="1.0.0"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Handle command line arguments
if [[ $# -gt 0 ]]; then
    case "$1" in
        -v|--version)
            echo "ra2mp3 v$VERSION"
            echo "Convert RealAudio (.ra) files to MP3 format"
            exit 0
            ;;
        -h|--help)
            echo "ra2mp3 v$VERSION - Convert RealAudio files to MP3"
            echo
            echo "Usage: $0 [OPTIONS]"
            echo
            echo "Options:"
            echo "  -v, --version    Show version information"
            echo "  -h, --help       Show this help message"
            echo
            echo "Description:"
            echo "  Recursively converts all .ra files in the current directory"
            echo "  and subdirectories to MP3 format. Output files are saved in"
            echo "  a 'converted/' directory maintaining the original structure."
            echo
            echo "Examples:"
            echo "  $0               Convert all .ra files in current directory"
            echo "  $0 --version     Show version"
            echo
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
fi

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo -e "${RED}Error: ffmpeg is not installed or not in PATH${NC}"
    echo "Please install ffmpeg first:"
    echo "  macOS: brew install ffmpeg"
    echo "  Ubuntu/Debian: sudo apt install ffmpeg"
    echo "  CentOS/RHEL: sudo yum install ffmpeg"
    exit 1
fi

# Count total files to convert
total_files=$(find . -type f -name '*.ra' | wc -l | tr -d ' ')

if [ "$total_files" -eq 0 ]; then
    echo -e "${YELLOW}No .ra files found in the current directory and subdirectories.${NC}"
    exit 0
fi

echo -e "${BLUE}Found $total_files RealAudio files to convert${NC}"
echo

# Initialize counter
current_file=0

find . -type f -name '*.ra' -print0 | while IFS= read -r -d '' file; do
  current_file=$((current_file + 1))
  rel="${file#./}"                       # strip leading "./"
  folder="$(dirname "$rel")"
  base="$(basename "$rel" .ra)"
  outdir="converted/$folder"
  outfile="$outdir/$base.mp3"

  mkdir -p "$outdir"

  if [[ -f "$outfile" ]]; then
    echo -e "${GREEN}[$current_file/$total_files] ✓ Exists, skip: $outfile${NC}"
    continue
  fi

  if [[ ! -f "$file" ]]; then
    echo -e "${RED}[$current_file/$total_files] ✗ Missing on disk: $file${NC}"
    continue
  fi

  echo -e "${BLUE}[$current_file/$total_files] → Converting: $file → $outfile${NC}"

  if ffmpeg -nostdin -hide_banner -loglevel warning -stats \
    -err_detect ignore_err \
    -i "$file" \
    -vn \
    -map_metadata -1 \
    -codec:a libmp3lame -q:a 2 \
    "$outfile" 2>/dev/null; then
    echo -e "${GREEN}[$current_file/$total_files] ✅ Successfully converted: $outfile${NC}"
  else
    echo -e "${RED}[$current_file/$total_files] ❌ Failed to convert: $file${NC}"
  fi
done

echo
echo -e "${GREEN}✅ All done! Check ./converted directory for your MP3 files.${NC}"
