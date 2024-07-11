#!/bin/bash

# Specify the output file name
output_file="folder_tree.md"

# Write the title to the output file
echo "# Folder Tree" > "$output_file"

# Get the current directory
current_dir=$(pwd)

# Use the find command to get directories and files, and format them as a tree structure
find . -print | sed -e 's;[^/]*/;|   ;g' -e 's;|   \([^|]\);|--- \1;' >> "$output_file"

echo "The folder tree has been saved to $output_file."
