#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
output_file="${input_file%.*}_links.txt"

# Use grep with a regular expression to find all links starting with "https" and ending with an endline
grep -oP 'https://[^\n]*' "$input_file" > "$output_file"

echo "Links extracted and saved to $output_file"
