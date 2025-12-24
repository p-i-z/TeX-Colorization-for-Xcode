# TeX & LaTeX Syntax Highlighting for Xcode

This plugin provides robust syntax highlighting for TeX and LaTeX documents directly within the Xcode IDE, turning it into a powerful, minimalist environment for academic and technical writing.

It was originally created by Patrick Iglesias-Zemmour and has been updated and improved in collaboration with Google's Gemini to be stable and reliable for modern Xcode versions.

![TeX in Xcode Dark Mode](screenshot.png)

## Features

*   **Robust Highlighting:** A stable, predictable, and fast highlighting engine designed to never crash.
*   **Hybrid Math Environment Support:**
    *   **Inline Math (`$...$`):** Rendered as a simple, solid block of color to make it stand out clearly from surrounding text.
    *   **Displayed Math (`$$...$$`):** The entire block is colored, with commands and braces highlighted inside for readability in large equations.
    *   **Bracketed Math (`\[...\]`):** Treated as standard commands for maximum stability. The text inside is highlighted normally.
*   **Expanded File Support:** Syntax highlighting is also applied to LaTeX style (`.sty`), class (`.cls`), and bibliography (`.bbl`) files.
*   **Code Folding:** All `\begin{...}...\end{...}` environments are fully foldable for easy navigation.
*   **Structure Highlighting:** Commands, braces (`{}`, `()`, `[]`), and comments are clearly distinguished.
*   **Light and Dark Themes:** Includes "Basic TeX" (Light) and "Dark TeX" (Dark) themes.

## Compatibility

*   **Modern Xcode (15+):** Works natively. You must click **"Load Bundle"** when Xcode first launches after installation.
*   **Older Xcode (12-14):** Supported via a list of compatibility UUIDs. If the plugin does not load, you may need to add your Xcode's specific UUID to the `Info.plist` file inside the bundle.

## Installation

1.  Download the `.zip` file from the latest **[Release](https://github.com/p-i-z/TeX-Colorization-for-Xcode/releases)**.
2.  Unzip the file.
3.  **Double-click** the `Install TeX for Xcode.command` file to run the installer.

A Terminal window will open and run the script.
You may be asked for your administrator password to complete the installation.

### Troubleshooting macOS Security

Modern versions of macOS have a security feature called Gatekeeper that may prevent the installer script from running because it was downloaded from the internet.

**Method 1: The Standard Workaround**
The first time you run the script,
**right-click** on the `Install TeX for Xcode.command` file and select **"Open"**.
A dialog will appear.
Click the **"Open"** button to grant an exception.

**Method 2: The "Power User" Fix (If Method 1 Fails)**
If macOS still refuses to run the script,
you will need to manually remove the "quarantine" flag that the system places on downloaded files.

1.  Open the **Terminal** application.
2.  Use the `cd` command to navigate to the folder where you unzipped the files.
    For example:
    ```sh
    cd ~/Downloads/TeX-Colorization-for-Xcode-v2.4
    ```
3.  Run the following command to remove the quarantine flag:
    ```sh
    xattr -d com.apple.quarantine "Install TeX for Xcode.command"
    ```
4.  After running this command,
    you should be able to double-click the installer,
    and it will run without any security warnings.
    
## Getting Started

1.  **Restart Xcode:** After installing, you must completely quit and restart Xcode.
2.  **Load the Bundle:** When prompted, click **"Load Bundle"**.
3.  **Select the Theme:** Go to **Xcode > Settings > Themes** and select either **"Basic TeX"** or **"Dark TeX"**.

## Building from Source (For Developers)

This repository is a complete Xcode project.
To build the plugin from source:

1.  Clone the repository and open the `TeX.xcodeproj` file.
2.  **Important:**
    Go to **Build Settings** and set **"User Script Sandboxing"** to **No**.
    This is required to allow the build script to copy the finished plugin.
3.  Press **⌘B** to build.
    A post-build script will automatically place the finished `TeX.ideplugin` bundle in the project's root directory.

## License

This project is licensed under the [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).
