# CONVRit
File Conversion utility on watched folders 



[TOC]

---

## Pandoc Docs to markdown

> a bash script that watches a Folder for changes, any new additions of one or more files with a word document extensions like '*.doc' or _'.docx' files and where possible make all input file names lowercase, replaces any spaces with an underscore, automatically convert them using  [Pandoc][pandoc] to [markdown][markdown] (md) format documents of the same name with a "\*md" extension, move the original input file(s) to a sub-folder called "converted", any name conflict to add a date-stamp addition to the filename.

Here's a bash script that accomplishes what you've described using `inotifywait` to monitor a folder and [Pandoc][pandoc]  for conversion:

[doc2md.sh](./src/doc2md.sh)

To use this script:

1. Save it as something like `./src/doc2md.sh`
2. Make it executable: `chmod +x ./src/doc2md.sh`
3. Run it with optional directory parameter: `./src/doc2md.sh /path/to/watch`

## Requirements:

- Install `inotify-tools` (for `inotifywait`):
  - Ubuntu/Debian: `sudo apt-get install inotify-tools`
  - Fedora: `sudo dnf install inotify-tools`
- Install `pandoc`:
  - Ubuntu/Debian: `sudo apt-get install pandoc`
  - Fedora: `sudo dnf install pandoc`



## Installation & Setup

1. TODO





## Features:

- Monitors specified directory (or current directory if none specified)
- Creates a "converted" subfolder if it doesn't exist
- Converts .doc and .docx files to markdown
- Makes filenames lowercase and replaces spaces with underscores
- Adds timestamp to filename if there's a conflict
- Moves original files to "converted" subfolder after successful conversion
- Provides feedback about what's happening

The script will run continuously until you stop it (Ctrl+C). It processes files as they're added to the watched directory.

Since this worked out nicely, I'll go grab that virtual coffee now! ☕ Enjoy your document conversion automation!

---

## Wishlist for CONVRit - Document Conversion Utilities

---

> **TODO:** draft a `Wishlist.md` document tailored for the [CONVRit][1] repository (https://github.com/DavitTec/convrit). This wishlist assumes the perspective of a typical Windows 10+ user who prefers GUI over terminal commands, while also providing a roadmap of TODOs for expanding the [convrit][1] utility collection. Since you're revisiting Windows development after a long hiatus, I've kept it practical and focused on user-friendly enhancements, leveraging your existing `doc2md.sh` as a starting point.

Welcome to CONVRit (v0.0.2), a growing collection of utilities designed to simplify document conversions! Starting with `doc2md.sh`—a script that converts DOC/DOCX files to Markdown—this project aims to become a versatile toolkit for users who need fast, efficient file format conversions. Below is a wishlist of features and improvements, especially tailored for Windows 10+ users who prefer a graphical interface over command-line tools, along with a roadmap of TODOs to guide future development.

### Why CONVRit?
Markdown files open significantly faster than DOC/DOCX (up to 3x or more), making them ideal for quick access and editing. CONVRit aims to streamline this process and expand to other formats, all while keeping usability in mind—especially for Windows users unfamiliar with tools like Pandoc in a terminal.

### Current Features
- **DOC/DOCX to Markdown Conversion**: Converts `.doc` and `.docx` files to `.md` using Pandoc.
- **File Name Normalisation**: Makes filenames lowercase and replaces spaces with underscores.
- **Conflict Handling**: Adds timestamps to avoid overwriting existing files.
- **Original File Management**: Moves processed files to a `converted` subfolder.

### Wishlist for Windows Users
Here’s what we’d love to see in CONVRit to make it a go-to tool for Windows 10+ users:

#### Installation & Setup
1. **One-Click Installer**: A simple `.exe` or `.msi` installer that:
   - Downloads and installs dependencies (Pandoc, etc.).
   - Sets up CONVRit in a user-friendly directory (e.g., `C:\Program Files\CONVRit`).
   - Adds a desktop shortcut and Start menu entry.
2. **No Terminal Required**: A GUI installer that guides users through setup without needing Command Prompt or PowerShell.
3. **Bundled Dependencies**: Include Pandoc and any other tools in the package, so users don’t need to install them separately.
4. **Windows Context Menu Integration**: Right-click a DOC/DOCX file and select “Convert to Markdown” directly in File Explorer.

### User Interface

5. **Graphical User Interface (GUI)**:
   - A simple window where users can drag-and-drop files or folders for conversion.
   - Options to select input/output formats (starting with DOC/DOCX to Markdown).
   - A “Convert” button to start the process and a progress bar for feedback.
6. **Folder Monitoring Option**: A checkbox to “Watch this folder” for new DOC/DOCX files, mimicking the current `doc2md.sh` behavior but with a GUI toggle.
7. **Preview Pane**: Show a quick preview of the converted Markdown file before saving.

### Functionality

8. **More Format Support**:
   - DOC/DOCX to PDF, TXT, or HTML.
   - PDF to Markdown or TXT.
   - Markdown to DOCX or PDF (reverse conversion).
9. **Batch Processing**: Convert multiple files or an entire folder at once via the GUI.
10. **Custom Output Options**:
    - Choose output folder (default: same as input or `converted` subfolder).
    - Toggle filename normalization (lowercase, replace spaces).
    - Option to delete original files after conversion (with confirmation).
11. **Error Handling**: Display friendly error messages (e.g., “Pandoc not found” or “File is corrupted”) instead of terminal output.

### Usability
12. **Help Section**: A built-in “Help” button with basic instructions and a link to this GitHub repo.
13. **Portable Mode**: An option to run CONVRit from a USB drive without installation.
14. **Auto-Updates**: Check for new versions and prompt users to download them.

## Roadmap
Here’s a prioritized list of development tasks to make CONVRit more Windows-friendly:

### Phase 1: Basic Windows Integration (v0.1.0)
- [ ] Create a batch file (`doc2md.bat`) wrapper for `doc2md.sh` to run on Windows with WSL or Git Bash.
- [ ] Test and document manual installation steps for Windows (Pandoc, WSL, etc.).
- [ ] Research GUI frameworks (e.g., Python with Tkinter, PyQt, or Electron) for a simple interface.
- [ ] Build a prototype GUI for single-file DOC-to-MD conversion.

### Phase 2: Enhanced Features (v0.2.0)
- [ ] Add context menu integration using Windows Registry edits or a tool like SharpShell.
- [ ] Implement folder monitoring in the GUI (using Windows file system watchers).
- [ ] Expand format support (e.g., DOCX to PDF) with Pandoc options.
- [ ] Package as a portable `.exe` with embedded Pandoc.

### Phase 3: Polished Release (v1.0.0)
- [ ] Develop a full installer (using Inno Setup or NSIS).
- [ ] Add batch processing and custom output options in the GUI.
- [ ] Include a help section and basic error handling.
- [ ] Test on Windows 10 and 11 with a trial user group.

### How to Get Started (Windows 10+)
For now, CONVRit runs via command line with some setup:
1. **Install WSL** (Windows Subsystem for Linux):
   - Open PowerShell as Admin and run: `wsl --install`.
   - Install Ubuntu from the Microsoft Store.
2. **Install Pandoc**:
   - Download from https://pandoc.org/installing.html and run the `.msi`.
   - Or use Chocolatey: `choco install pandoc`.
3. **Install inotify-tools**:
   - In WSL Ubuntu, run: `sudo apt-get install inotify-tools`.
4. **Run CONVRit**:
   - Clone the repo: `git clone https://github.com/DavitTec/convrit.git`.
   - Navigate to `src/` and run: `bash doc2md.sh <folder_path>`.

Future versions will simplify this with a GUI and installer!

## Contribute!
Have ideas or want to help? Check out the [GitHub Issues](https://github.com/DavitTec/convrit/issues) page, fork the repo, and submit a pull request. Windows users, your feedback is especially welcome!

---

### Notes for the creator
- **GUI Options**: 

  - [Vscode][vscode ] 
  
  - Consider (cross-platform), Python with Tkinter or PyQt might be a gentle re-entry into Windows app development. They’re lightweight and integrate well with Pandoc.
  
- **Windows Context Menu**: SharpShell (available on GitHub) could simplify right-click integration.

- **Installer**: Inno Setup is free and straightforward for creating `.exe` installers.

- **25-Year Gap**: No worries! Modern tools like VS Code and GitHub make this much easier than XP-era dev. Start small with the GUI prototype and build from there.

Feel free to tweak this `Wishlist.md` and add it to your repo! Let me know if you’d like help refining specific TODOs or coding the GUI—I’d be happy to assist. Enjoy building CONVRit! ☕

## Help

Markdown help : [Footnote](https://www.markdownguide.org/extended-syntax/#footnotes)
Here's a sentence with a footnote[^99].

## References

- [arbitrary case-insensitive reference text]: https://www.mozilla.org	"optional text"

- [vscode]:  https://code.visualstudio.com/	"Visual Studio code editor"

- [pandoc]: https://pandoc.org/	"Pandoc  a universal document converter"

- [markdown]: https://www.markdownguide.org/	"Markdown is a lightweight markup language that you can use to add formatting elements to plaintext text documents."

## Footnotes

[1]: https://github.com/DavitTec/convrit	"CONVRit - a set of tools for file conversions"


