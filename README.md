# CONVRit
File Conversion utility on watched folders 

## Pandoc Docs to markdown

> a bash script that watches a Folder for changes, any new additions of one or more files with a word document extensions like '*.doc' or _'.docx' files and where possible make all input file names lowercase, replaces any spaces with an underscore, automatically convert them using PANDOC to markdown (md) format documents of the same name with a "\*md" extension, move the original input file(s) to a sub-folder called "converted", any name conflict to add a date-stamp addition to the filename.

Here's a bash script that accomplishes what you've described using `inotifywait` to monitor a folder and `pandoc` for conversion:

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
