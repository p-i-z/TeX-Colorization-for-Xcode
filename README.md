# TeX & LaTeX Syntax Highlighting for Xcode

This plugin provides full-featured syntax highlighting for TeX and LaTeX documents directly within the Xcode IDE, turning it into a powerful, minimalist environment for academic and technical writing.

It was originally created by Patrick Iglesias-Zemmour and has been updated and improved in collaboration with Google's Gemini to be more robust and stable for modern Xcode versions.

## Features

*   **Robust Highlighting:** A stable, predictable, and fast highlighting engine.
*   **Full Math Environment Support:**
    *   **Displayed Math (`$$...$$` and `\[...\]`):** The entire block is colored, with commands and braces highlighted inside for readability in large equations.
    *   **Inline Math (`$...$`):** The entire block is given a solid color to make it stand out clearly from surrounding text.
*   **Code Folding:** All `\begin{...}...\end{...}` environments are fully foldable, making it easy to navigate large documents.
*   **Structure Highlighting:**
    *   Commands (`\section`, `\textbf`, etc.) are colored.
    *   Braces (`{` and `}`) are given a distinct color to help visually balance them.
    *   Comments (`%`) are clearly distinguished.
*   **Light and Dark Themes:** Comes with two custom Xcode themes:
    *   **Basic TeX:** A pleasant, low-contrast light theme.
    *   **Dark TeX:** A beautiful dark theme for late-night work.

## Compatibility

This plugin is designed to be backward compatible, but the installation process varies depending on your version of Xcode.

#### For Modern Xcode (approx. version 15 and newer)

*   **Tested and working up to Xcode 16.4 (November 2025).**
*   On these versions, the old UUID check is no longer the main issue. When you first launch Xcode after installation, you should be prompted with a dialog box. **You must click "Load Bundle"** to enable the plugin.

#### For Older Xcode (approx. versions 12, 13, 14)

*   This plugin contains a long list of compatibility UUIDs and should work for many of these versions out of the box.
*   **If the plugin does not load**, it is because your specific version of Xcode has a UUID that is not in the list. You will need to add it manually.
*   To find your Xcode's UUID, run the following command in the Terminal app:
    ```sh
    defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID
    ```
*   Copy the resulting UUID string.
*   Right-click on `TeX.ideplugin`, choose "Show Package Contents," and open the `Info.plist` file.
*   Add the copied UUID as a new string inside the `DVTPlugInCompatibilityUUIDs` array.
*   Save the file and restart Xcode.

## Installation

The provided script is the easiest way to install.

1.  Download the `.zip` file from the latest [Release](https://github.com/p-i-z/TeX-Colorization-for-Xcode/releases).
2.  Unzip the project files.
3.  Open the Terminal application and navigate into the unzipped folder using the `cd` command.
4.  Make the script executable and run it:
    ```sh
    chmod +x TeX-Xcode-setup.sh
    ./TeX-Xcode-setup.sh
    ```
The script will copy all necessary files to their correct locations.

## Getting Started

1.  **Restart Xcode:** After installing, you must completely quit and restart Xcode.
2.  **Load the Bundle:** When prompted, click **"Load Bundle"**.
3.  **Select the Theme:** Go to **Xcode > Settings > Themes** and select either **"Basic TeX"** or **"Dark TeX"**.

## Using Xcode as a TeX Environment

To configure Xcode to compile your `.tex` files:

1.  Go to **Product > Scheme > Edit Scheme**.
2.  Select the **"Build"** phase and expand the **"Pre-actions"** section.
3.  Click `+` to add a **"New Run Script Action"**.
4.  Paste the following command, replacing `YourFile.tex` with the name of your main document:
    ```sh
    /Library/TeX/texbin/pdflatex "${SRCROOT}/YourFile.tex"
    ```
Now, pressing **⌘B** (Build) will compile your document.
