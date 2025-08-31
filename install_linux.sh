#!/usr/bin/env bash
set -euo pipefail

VERSION="1.4.0"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}ra2mp3 v$VERSION Installation Helper (Linux)${NC}"
echo "=============================================="
echo

# Function to detect Linux distribution
detect_distro() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo $ID
    elif [[ -f /etc/redhat-release ]]; then
        echo "rhel"
    elif [[ -f /etc/debian_version ]]; then
        echo "debian"
    else
        echo "unknown"
    fi
}

# Check if we're on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo -e "${YELLOW}This installer is designed for Linux.${NC}"
    echo "For other systems:"
    echo "  macOS: Use install_macos.sh"
    echo "  Windows: Use WSL or install ffmpeg manually"
    exit 0
fi

# Detect distribution
DISTRO=$(detect_distro)
echo -e "${BLUE}Detected Linux distribution: $DISTRO${NC}"
echo

# Check if ffmpeg is already installed
if command -v ffmpeg &> /dev/null; then
    echo -e "${GREEN}✅ FFmpeg is already installed${NC}"
    
    # Show ffmpeg version
    ffmpeg_version=$(ffmpeg -version 2>/dev/null | head -n1 | cut -d' ' -f3)
    echo -e "   Version: ${BLUE}$ffmpeg_version${NC}"
    echo
    echo -e "${GREEN}🎉 Installation complete!${NC}"
else
    echo -e "${YELLOW}FFmpeg not found. Installing FFmpeg...${NC}"
    echo

    case "$DISTRO" in
        ubuntu|debian|pop|elementary|linuxmint)
            echo "Installing ffmpeg using apt..."
            if sudo apt update && sudo apt install -y ffmpeg; then
                echo -e "${GREEN}✅ FFmpeg installed successfully via apt!${NC}"
            else
                echo -e "${RED}❌ Failed to install FFmpeg via apt${NC}"
                echo "Please try manually: sudo apt install ffmpeg"
                exit 1
            fi
            ;;
        fedora)
            echo "Installing ffmpeg using dnf..."
            if sudo dnf install -y ffmpeg; then
                echo -e "${GREEN}✅ FFmpeg installed successfully via dnf!${NC}"
            else
                echo -e "${RED}❌ Failed to install FFmpeg via dnf${NC}"
                echo "You may need to enable RPM Fusion repositories first:"
                echo "  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-\$(rpm -E %fedora).noarch.rpm"
                echo "Then try: sudo dnf install ffmpeg"
                exit 1
            fi
            ;;
        rhel|centos|rocky|almalinux)
            echo "Installing ffmpeg using yum/dnf..."
            # Try dnf first (newer systems), fall back to yum
            if command -v dnf &> /dev/null; then
                if sudo dnf install -y epel-release && sudo dnf install -y ffmpeg; then
                    echo -e "${GREEN}✅ FFmpeg installed successfully via dnf!${NC}"
                else
                    echo -e "${RED}❌ Failed to install FFmpeg via dnf${NC}"
                    echo "You may need to enable EPEL and RPM Fusion repositories"
                    exit 1
                fi
            elif command -v yum &> /dev/null; then
                if sudo yum install -y epel-release && sudo yum install -y ffmpeg; then
                    echo -e "${GREEN}✅ FFmpeg installed successfully via yum!${NC}"
                else
                    echo -e "${RED}❌ Failed to install FFmpeg via yum${NC}"
                    echo "You may need to enable EPEL and RPM Fusion repositories"
                    exit 1
                fi
            else
                echo -e "${RED}❌ No package manager found (dnf/yum)${NC}"
                exit 1
            fi
            ;;
        arch|manjaro)
            echo "Installing ffmpeg using pacman..."
            if sudo pacman -S --noconfirm ffmpeg; then
                echo -e "${GREEN}✅ FFmpeg installed successfully via pacman!${NC}"
            else
                echo -e "${RED}❌ Failed to install FFmpeg via pacman${NC}"
                echo "Please try manually: sudo pacman -S ffmpeg"
                exit 1
            fi
            ;;
        opensuse*|sles)
            echo "Installing ffmpeg using zypper..."
            if sudo zypper install -y ffmpeg; then
                echo -e "${GREEN}✅ FFmpeg installed successfully via zypper!${NC}"
            else
                echo -e "${RED}❌ Failed to install FFmpeg via zypper${NC}"
                echo "You may need to add Packman repository first:"
                echo "  sudo zypper addrepo -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman"
                echo "Then try: sudo zypper install ffmpeg"
                exit 1
            fi
            ;;
        *)
            echo -e "${YELLOW}Unknown or unsupported Linux distribution: $DISTRO${NC}"
            echo "Please install ffmpeg manually using your system's package manager:"
            echo "  Ubuntu/Debian: sudo apt install ffmpeg"
            echo "  Fedora: sudo dnf install ffmpeg"
            echo "  RHEL/CentOS: sudo yum install epel-release && sudo yum install ffmpeg"
            echo "  Arch: sudo pacman -S ffmpeg"
            echo "  openSUSE: sudo zypper install ffmpeg"
            exit 1
            ;;
    esac

    echo
    echo -e "${GREEN}🎉 Installation complete!${NC}"
fi

echo
echo "You can now use ra2mp3:"
echo "  1. Place the conversion script in a directory with .ra files"
echo "  2. Run: ./ra2mp3"
echo
echo -e "${BLUE}Tip:${NC} Make sure ra2mp3 is executable:"
echo "      chmod +x ra2mp3"
