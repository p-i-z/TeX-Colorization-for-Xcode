#!/bin/sh

#  Install TeX for Xcode.command
#  TeX-Project
#
#  Created by Patrick I-Z on 24/12/2025.
#  
#!/bin/bash

set -e

echo "Starting TeX Colorization for Xcode installation..."

# 1. Find the Plugin Bundle
#    Assumes the script is in the same folder as the plugin.
SOURCE_DIR=$(pwd)
PLUGIN_NAME="TeX.ideplugin"
PLUGIN_PATH="$SOURCE_DIR/$PLUGIN_NAME"
WORKER_SCRIPT="$PLUGIN_PATH/Contents/Resources/install_worker.sh"

# 2. Verify the Bundle exists
if ! [ -d "$PLUGIN_PATH" ]; then
    echo "Error: $PLUGIN_NAME not found."
    echo "Please make sure the 'TeX.ideplugin' is in the same directory as this script."
    exit 1
fi

# 3. Verify the Worker Script exists
if ! [ -f "$WORKER_SCRIPT" ]; then
    echo "Error: Installation script not found inside the bundle."
    echo "The plugin may be corrupted or built incorrectly."
    exit 1
fi

# 4. Launch the Worker
#    We use 'bash' explicitly to ensure execution.
bash "$WORKER_SCRIPT"

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
