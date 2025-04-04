#!/bin/bash
# version 0.0.1
# Directory to watch (default is current directory if not specified)
WATCH_DIR="${1:-.}"

# Ensure converted subdirectory exists
CONVERTED_DIR="$WATCH_DIR/converted"
mkdir -p "$CONVERTED_DIR"

# Check if required tools are installed
if ! command -v inotifywait >/dev/null 2>&1; then
  echo "Error: inotifywait not found. Please install inotify-tools"
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc not found. Please install pandoc"
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
      pandoc "$original_file" -o "$md_file" --standalone

      # Move original file to converted folder
      if [ -f "$md_file" ]; then
        mv "$original_file" "$CONVERTED_DIR/"
        echo "Converted and moved: $filename"
      else
        echo "Conversion failed for: $filename"
      fi
    fi
  done
