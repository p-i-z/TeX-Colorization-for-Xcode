# TeX & LaTeX Syntax Highlighting for Xcode

This plugin provides full-featured syntax highlighting for TeX and LaTeX documents directly within the Xcode IDE,
turning it into a powerful,
minimalist environment for academic and technical writing.

It was originally created by Patrick Iglesias-Zemmour and has been updated and improved in collaboration with Google's Gemini to be more robust and stable for modern Xcode versions.

![TeX in Xcode Dark Mode](Screenshot.png)

## Features

*   **Robust Highlighting:**
    A stable,
    predictable,
    and fast highlighting engine.
*   **Full Math Environment Support:**
    *   **Displayed Math (`$$...$$` and `\[...\]`):**
        The entire block is colored,
        with commands and braces highlighted inside for readability.
    *   **Inline Math (`$...$`):**
        The entire block is given a solid color to make it stand out clearly from surrounding text.
*   **Code Folding:**
    All `\begin{...}...\end{...}` environments are fully foldable.
*   **Structure Highlighting:**
    Commands,
    braces,
    and comments are clearly distinguished.
*   **Light and Dark Themes:**
    Includes "Basic TeX" (Light) and "Dark TeX" (Dark).

## Compatibility

*   **Modern Xcode (15+):**
    Works natively.
    You must click **"Load Bundle"** when Xcode launches.
*   **Older Xcode (12-14):**
    Supported via UUID matching.
    See the `Info.plist` if you need to add a specific UUID.

## Installation

1.  Download the `.zip` file from the latest **[Release](https://github.com/p-i-z/TeX-Colorization-for-Xcode/releases)**.
2.  Unzip the file.
3.  **Double-click** the `Install TeX for Xcode.command` file.
    A Terminal window will open and run the installer.
    You may be asked for your administrator password.

    *Note:
    If you see a security warning,
    right-click the file and choose "Open" instead.*

## Getting Started

1.  **Restart Xcode:**
    After installing,
    you must completely quit and restart Xcode.
2.  **Load the Bundle:**
    When prompted,
    click **"Load Bundle"**.
3.  **Select the Theme:**
    Go to **Xcode > Settings > Themes** and select either **"Basic TeX"** or **"Dark TeX"**.

## Source Code

Currently,
this repository hosts the compiled plugin and the installation tools.
The full Xcode project source is not included to keep the repository lightweight.

If you are a developer and wish to modify the plugin,
please open an Issue or contact me.
If there is interest,
I will upload the full Xcode project structure here.
