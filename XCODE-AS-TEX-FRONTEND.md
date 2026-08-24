# Using Xcode as a LaTeX Front-End with Automated Clean-up

This guide explains how to turn Xcode into a fully functional LaTeX IDE by setting up an automated dual-pass compilation sequence that resolves cross-references and cleans up auxiliary files upon success.

> **Note:** This specific configuration is tailored for **LaTeX (pdflatex)** compilation. It is not configured for plain TeX or XeTeX.

---

## Prerequisites

Ensure that MacTeX or BasicTeX is installed on your Mac, and that `pdflatex` is located at:
`/Library/TeX/texbin/pdflatex`

---

## Step-by-Step Configuration in Xcode

### 1. Create a Custom Target
1. Open your project in Xcode.
2. Select your project in the project navigator (top of the left sidebar).
3. Click the **`+`** button at the bottom of the **Targets** list.
4. Search for **Cross-platform**, scroll down to the **Other** section, and select **External Build System**.
5. Name your target (e.g., `LaTeX-Build`).

### 2. Add the Compilation Script
1. With your new target selected, navigate to the **Build Phases** tab.
2. Click the **`+`** icon in the top left of the main pane and select **New Run Script Phase**.
3. Expand the **Run Script** section and replace any default placeholder text with the following Shell script:

```bash
# =========================================================================
# LaTeX Automated Dual-Pass Compilation & Clean-up Script
# Tailored for pdflatex on macOS (Intel & Apple Silicon M-series)
# Developed by Patrick Iglesias-Zemmour
# =========================================================================

# IMPORTANT: Replace "YOUR_FILE_NAME" below with the actual name of your root .tex file (without extension)
# For example, if your file is "my_article.tex", change it to: FILE_NAME="my_article"
FILE_NAME="YOUR_FILE_NAME"

TEX_FILE="SRCROOT/{FILE_NAME}.tex"
BASE_PATH="SRCROOT/{FILE_NAME}"

echo "Starting Pass 1/2 with pdflatex..."
/Library/TeX/texbin/pdflatex -output-directory "SRCROOT" "{TEX_FILE}"

# Check if the first pass succeeded (Exit code 0)
if [ \$? -eq 0 ]; then
    echo "Pass 1/2 succeeded. Starting Pass 2/2 to resolve cross-references & TOC..."
    /Library/TeX/texbin/pdflatex -output-directory "SRCROOT" "{TEX_FILE}"
    
    if [ \$? -eq 0 ]; then
        echo "Pass 2/2 succeeded. Automatically purging auxiliary files..."
        
        # Safely remove auxiliary files to keep your directory pristine
        rm -f "\({BASE_PATH}.aux" "\){BASE_PATH}.log" "\({BASE_PATH}.toc" "\){BASE_PATH}.out"
        echo "Clean-up complete. Build successful!"
        
        # Optional: Uncomment the following line if you want to open the PDF in Preview after building
        # open "\${BASE_PATH}.pdf"
    else
        echo "Error: pdflatex failed during the second pass. Auxiliary files preserved for debugging."
        exit 1
    fi
else
    echo "Error: pdflatex failed during the first pass. Log files preserved for debugging."
    exit 1
fi
```

### 3. Customize the Script for Your Project
Before building, you **must** edit the script to point to your specific document:
* In the script editor window inside Xcode, look for the line: `FILE_NAME="YOUR_FILE_NAME"`
* Replace `YOUR_FILE_NAME` with the exact name of your main `.tex` file, omitting the `.tex` extension.

### 4. How to Build
Simply select your `LaTeX-Build` scheme in Xcode and hit **`Cmd + B`** (Product > Build). 

* **On Success:** Your cross-references (TOC, citations, labels) will be perfectly updated, your final `.pdf` will be created or refreshed, and all messy `.aux`, `.log`, `.toc`, or `.out` files will be automatically wiped from your project folder.
* **On Failure:** Xcode will stop the build immediately, and the `.log` and `.aux` files will be preserved in your project folder so you can investigate your TeX syntax errors. You can view compilation logs inside Xcode's **Report Navigator** (the speech bubble icon on the far right of the left sidebar).
