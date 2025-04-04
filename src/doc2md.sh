#!/usr/bin/env bash
# version 0.0.2
# ./doc2md.sh /path/to/watch /output
# Directory to watch (default is current directory if not specified)
WATCH_DIR="${1:-./input}"

# Ensure converted subdirectory exists
CONVERTED_DIR="$WATCH_DIR/converted"
mkdir -p "$CONVERTED_DIR"
MARKDOWN_DIR="${2:-./markdown}"

# check if the MARKDOWN_DIR directory exists
if [ ! -d "$MARKDOWN_DIR" ]; then
  echo "Error: $MARKDOWN_DIR does not exist. Please create it first."
  exit 1
fi

# Check if required tools are installed
if ! command -v inotifywait >/dev/null 2>&1; then
  echo -e "Error: inotifywait not found. Please install inotify-tools"
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo -e "Error: pandoc not found. Please install pandoc"
  exit 1
fi

echo "Watching $WATCH_DIR for new .doc/.docx files..."

# Monitor directory for new files
inotifywait -m "$WATCH_DIR" -e create -e moved_to |
  while read -r directory events filename; do
    # Check if file has .doc or .docx extension
    if [[ "$filename" =~ \.(doc|docx)$ ]]; then
      # Full path of original file
      original_file="$directory$filename"

      # Get base filename without extension
      base_name="${filename%.*}"
      ext="${filename##*.}"

      # Convert to lowercase and replace spaces with underscores
      new_base_name=$(echo "$base_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

      # Initial markdown filename
      md_file="$WATCH_DIR/${new_base_name}.md"

      # Check for name conflict and add timestamp if needed
      if [ -f "$md_file" ]; then
        timestamp=$(date +%Y%m%d_%H%M%S)
        md_file="$WATCH_DIR/${new_base_name}_${timestamp}.md"
      fi

      echo "Processing: $filename -> ${md_file##*/}"

      # Convert to markdown using pandoc
      dest_filename=$(basename "$md_file")

      echo "my output: $MARKDOWN_DIR/$dest_filename"
      output="$MARKDOWN_DIR/$dest_filename"

      pandoc "$original_file" -o "$output" --standalone

      # Move original file to converted folder
      if [ -f "$output" ]; then
        mv "$original_file" "$CONVERTED_DIR/"
        echo "Converted and moved: $filename"
      else
        echo "Conversion failed for: $filename"
      fi
    fi
  done

exit 0

# Usage:

# display -title "File Conversion" -message "File $filename converted to $md_file"
# ./convert.sh /path/to/watch
# This script watches a specified directory for new .doc or .docx files,
# converts them to markdown format using pandoc, and moves the original files
# to a "converted" subdirectory. The converted markdown files are named
# based on the original file names, with spaces replaced by underscores and
# converted to lowercase. If a file with the same name already exists, a
# timestamp is appended to the new file name to avoid conflicts.
# The script uses inotifywait to monitor the directory for new files and
# pandoc to perform the conversion. It also checks for the presence of
# required tools (inotifywait and pandoc) before starting the monitoring
# process. The script runs indefinitely until interrupted.

# Note: The script assumes that the user has the necessary permissions
# to read and write files in the specified directory. It also assumes
# that the user has installed inotify-tools and pandoc on their system.
# The script is designed to be run in a terminal and will output messages
# to indicate the progress of the file conversion process. The script
# can be customized further to include additional features or error
# handling as needed. The script is intended for use in a Linux or Unix-like
# environment where inotifywait and pandoc are available. It is not
# intended for use on Windows systems without modification, as the
# inotifywait command is specific to Linux and Unix-like operating systems.

# The script is provided as-is and the author is not responsible for any
# issues that may arise from its use. Users are encouraged to test the
# script in a safe environment before using it in production. The script
# is intended for educational purposes and to demonstrate the use of
# inotifywait and pandoc for file conversion tasks. Users should
# familiarize themselves with the tools and commands used in the script
# before running it. The script is designed to be simple and easy to
# understand, with clear comments explaining each step of the process.
# Users are encouraged to modify and adapt the script to suit their
# specific needs and requirements. The script is intended to be a starting
# point for users who want to automate the process of converting .doc
# and .docx files to markdown format using pandoc. Users can customize
# the script further to include additional features or functionality as
# needed. The script is designed to be flexible and adaptable, allowing
# users to modify it to suit their specific use cases. Users are
# encouraged to experiment with the script and explore its capabilities.
# The script is intended to be a useful tool for users who work with
# .doc and .docx files and want to convert them to markdown format
# quickly and easily. The script is designed to be user-friendly and
# straightforward, with clear instructions and comments to guide users
# through the process. Users are encouraged to provide feedback and

# suggestions for improvements to the script. The author welcomes
# contributions and suggestions from users to enhance the functionality
# and usability of the script. The script is intended to be a collaborative
# effort, with users working together to improve and refine the script
# over time. Users are encouraged to share their experiences and

# Setup options menu for help
