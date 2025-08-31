#!/usr/bin/env bash
set -euo pipefail

VERSION="1.4.0"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}ra2mp3 v$VERSION Installation Helper${NC}"
echo "====================================="
echo

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo -e "${YELLOW}This installer is designed for macOS.${NC}"
    echo "For other systems, please install ffmpeg manually:"
    echo "  Ubuntu/Debian: sudo apt install ffmpeg"
    echo "  CentOS/RHEL: sudo yum install ffmpeg"
    exit 0
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Installing Homebrew...${NC}"
    echo "This will require your password and may take a few minutes."
    echo
    
    # Install Homebrew
    if /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; then
        echo -e "${GREEN}✅ Homebrew installed successfully!${NC}"
        echo
        
        # Add Homebrew to PATH for the current session
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    else
        echo -e "${RED}❌ Failed to install Homebrew. Please install manually from https://brew.sh${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ Homebrew is already installed${NC}"
fi

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo -e "${YELLOW}FFmpeg not found. Installing FFmpeg...${NC}"
    
    if brew install ffmpeg; then
        echo -e "${GREEN}✅ FFmpeg installed successfully!${NC}"
    else
        echo -e "${RED}❌ Failed to install FFmpeg. Please try: brew install ffmpeg${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✅ FFmpeg is already installed${NC}"
    
    # Show ffmpeg version
    ffmpeg_version=$(ffmpeg -version 2>/dev/null | head -n1 | cut -d' ' -f3)
    echo -e "   Version: ${BLUE}$ffmpeg_version${NC}"
fi

echo
echo -e "${GREEN}🎉 Installation complete!${NC}"
echo
echo "You can now use ra2mp3:"
echo "  1. Place this script in a directory with .ra files"
echo "  2. Run: ./ra2mp3"
echo
echo -e "${BLUE}Tip:${NC} Make sure ra2mp3 is executable:"
echo "      chmod +x ra2mp3"
