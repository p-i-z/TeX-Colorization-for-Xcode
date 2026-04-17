#!/bin/bash

# install_worker.sh
# This script lives INSIDE the TeX.ideplugin bundle (in Contents/Resources).
# It performs the actual copying of files.

set -e

# 1. Find where I am (The Resources folder inside the bundle)
#    "$(dirname "$0")" gets the folder where this script is located.
RESOURCES_DIR="$(cd "$(dirname "$0")" && pwd)"

# 2. Define Destinations
PLUGINS_DIR=~/Library/Developer/Xcode/Plug-ins
SPECS_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"
METADATA_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
THEMES_DIR=~/Library/Developer/Xcode/UserData/FontAndColorThemes

echo "--- Installing from Bundle Resources ---"

# 3. Create Directories
mkdir -p "$PLUGINS_DIR"
mkdir -p "$THEMES_DIR"

# 4. Install the Plugin Bundle itself
#    We need to go up two levels from Resources to find the .ideplugin folder
PLUGIN_BUNDLE_PATH="$(dirname "$(dirname "$RESOURCES_DIR")")"
PLUGIN_NAME=$(basename "$PLUGIN_BUNDLE_PATH")

echo "Installing $PLUGIN_NAME..."
rm -rf "$PLUGINS_DIR/$PLUGIN_NAME"
cp -R "$PLUGIN_BUNDLE_PATH" "$PLUGINS_DIR/"

# 5. Install Themes (Located next to this script)
echo "Installing themes..."
cp "$RESOURCES_DIR/Basic TeX.xccolortheme" "$THEMES_DIR/"
cp "$RESOURCES_DIR/Dark TeX.xccolortheme" "$THEMES_DIR/"

# 6. Install System Files (Located next to this script)
echo ""
echo "You may be asked for your administrator password to install system-level components."

echo "Installing TeX.xclangspec..."
sudo cp "$RESOURCES_DIR/TeX.xclangspec" "$SPECS_DIR/"

echo "Installing Xcode.SourceCodeLanguage.TeX.plist..."
sudo cp "$RESOURCES_DIR/Xcode.SourceCodeLanguage.TeX.plist" "$METADATA_DIR/"

echo ""
echo "--- Internal Installation Complete ---"
