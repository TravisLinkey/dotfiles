#!/bin/bash

PROGRAM_PATH="/Users/travislinkey/Projects/cpp/workspace/dir-finder/main.o"

# Get the output and extract only the path (last line)
output="$($PROGRAM_PATH "$1")" || { echo "Not Found: $1" >&2; exit 1; }
dest=$(echo "$output" | tail -n 1)
echo "$dest"