#!/bin/bash

base_path="$HOME/Documents/Obsidian/Travis"

find_directory() {
  local file=$1
  find "$base_path" -type d -regex ".*$file.*"
}

find_file() {
  local file=$1
  find "$base_path" -type f -regex ".*$file.*"
}

source_file=$1
destination_file=$2

# get file to move
# echo "Source file: "
# read source_file

file_to_move=$(find_file $source_file)

if [[ -z "$file_to_move" ]]; then
  echo "Could not find directory"
  exit 1
fi

# get destination path
# printf "\n"
# echo "Destination directory: "
# read dest_path
results=$(find_directory $dest_path)

if [[ -z "$results" ]]; then
  echo "Could not find directory"
  exit 1
fi

printf "Destination directories:\n${results}"

# Ask the user if they are sure they want to move it
printf "Are you sure you want to move $file_to_move\n to\n $results?\n (Y/N)\n"

read answer

if [[ "$answer" == "Y" ]]; then
  echo "File moved!"
  mv "$file_to_move" "$results"
else
  echo "Not gonna do it"
fi

  
