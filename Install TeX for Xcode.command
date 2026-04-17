#!/bin/bash

# ============================================================
# Install TeX for Xcode.command
# Launcher script for TeX Colorization for Xcode plugin
# ============================================================

set -e

echo "=================================================="
echo "  TeX Colorization for Xcode - Installer"
echo "=================================================="
echo ""

# Find the directory where THIS script is located
# Works with double-click, right-click → Open, or Terminal
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PLUGIN_NAME="TeX.ideplugin"
PLUGIN_PATH="$SCRIPT_DIR/$PLUGIN_NAME"
WORKER_SCRIPT="$PLUGIN_PATH/Contents/Resources/install_worker.sh"

# Verify the Bundle exists
if ! [ -d "$PLUGIN_PATH" ]; then
    echo "Error: $PLUGIN_NAME not found."
    echo "Looking in: $SCRIPT_DIR"
    echo ""
    echo "Make sure '$PLUGIN_NAME' is in the same directory as this script."
    exit 1
fi
echo "Found $PLUGIN_NAME"

# Verify the Worker Script exists
if ! [ -f "$WORKER_SCRIPT" ]; then
    echo "Error: Installation script not found inside the bundle."
    echo "The plugin may be corrupted or built incorrectly."
    exit 1
fi
echo "Found installer worker"

# Remove quarantine from the plugin bundle (prevents permission issues)
echo "Removing macOS quarantine flags..."
xattr -d com.apple.quarantine "$PLUGIN_PATH" 2>/dev/null || true

echo ""
echo "Installing plugin..."

# Launch the Worker
bash "$WORKER_SCRIPT"

echo ""
echo "=================================================="
echo "Installation Complete!"
echo ""
echo "NEXT STEPS:"
echo "  1. Quit and restart Xcode"
echo "  2. Click 'Load Bundle' when prompted"
echo "  3. Go to Xcode > Settings > Themes"
echo "  4. Select 'Basic TeX' or 'Dark TeX'"
echo "=================================================="
echo ""

exit 0