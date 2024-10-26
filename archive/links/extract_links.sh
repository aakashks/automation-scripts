#!/bin/bash

# Check if arguments are incorrectly specified
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
output_file="links_${input_file%.*}.txt"

# Empty the output file
> $output_file

# Use grep with a regular expression to find all links starting with "https" and ending with an endline
grep -oP 'https://[^\ ]*' "$input_file" > "$output_file"

echo "Links extracted and saved to $output_file"
