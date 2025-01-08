#!/bin/bash

# This script attempts to process files in a directory but has a subtle bug.

find . -type f -print0 | while IFS= read -r -d $'\0' file; do
  # Incorrectly using a variable within a subshell
  ( some_command "$file" ) & 
  echo "Processing: $file"
done

wait # Wait for background processes to finish