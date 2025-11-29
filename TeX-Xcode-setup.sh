#!/bin/bash

# TeX-Xcode-setup.sh
# Installs the TeX syntax highlighting plugin and themes for Xcode.

set -e

echo "Starting TeX Colorization for Xcode installation..."

SOURCE_DIR=$(pwd)

PLUGINS_DIR=~/Library/Developer/Xcode/Plug-ins
SPECS_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"
METADATA_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
THEMES_DIR=~/Library/Developer/Xcode/UserData/FontAndColorThemes

# --- Verify Source Files ---
if ! [ -d "$SOURCE_DIR/TeX.ideplugin" ]; then
    echo "Error: Source files not found. Please run this script from the project's root directory."
    exit 1
fi

# --- Install Files ---
echo "Creating directories if they do not exist..."
mkdir -p "$PLUGINS_DIR"
mkdir -p "$THEMES_DIR"

echo "Installing TeX.ideplugin..."
cp -R "$SOURCE_DIR/TeX.ideplugin" "$PLUGINS_DIR/"

echo "Installing themes..."
cp "$SOURCE_DIR/Basic TeX.xccolortheme" "$THEMES_DIR/"
cp "$SOURCE_DIR/Dark TeX.xccolortheme" "$THEMES_DIR/"

echo ""
echo "You may be asked for your administrator password for system files."

echo "Installing TeX.xclangspec..."
sudo cp "$SOURCE_DIR/TeX.xclangspec" "$SPECS_DIR/"

echo "Installing Xcode.SourceCodeLanguage.TeX.plist..."
sudo cp "$SOURCE_DIR/Xcode.SourceCodeLanguage.TeX.plist" "$METADATA_DIR/"

echo ""
echo "--------------------------------------------------"
echo "Installation Complete!"
echo ""
echo "NEXT STEPS:"
echo "1. Quit and Restart Xcode."
echo "2. Click 'Load Bundle' when prompted."
echo "3. Go to Xcode > Settings > Themes and select 'Basic TeX' or 'Dark TeX'."
echo "--------------------------------------------------"
echo ""

exit 0
