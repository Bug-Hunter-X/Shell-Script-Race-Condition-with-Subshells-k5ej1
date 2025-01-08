#!/bin/bash

# Corrected script using process substitution to avoid race conditions

while IFS= read -r -d $'\0' file; do
  # Use process substitution to pass the filename to the subshell
  ( some_command "$file" ) &
  echo "Processing: $file"
done < <(find . -type f -print0)

wait # Wait for background processes to finish