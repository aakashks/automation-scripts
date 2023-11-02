#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
output_file="${input_file%.*}_links.md"

# Empty the output file
> $output_file

# Use a regular expression to find links starting with "https" and ending with a space
regex="https[^\ ]+"

while read -r line; do
  if [[ $line =~ $regex ]]; then
    link="${BASH_REMATCH[0]}"
    # Read the next line to get the title
    read -r discard
    read -r title
    # Write the title and link in the desired format to the output file
    
    # if the title is blank
    if [[ $title =~ "^$" ]]; then
      echo "- $link" >> "$output_file"
    else
      echo "- [$title]($link)" >> "$output_file"
    fi
  fi
done < "$input_file"

echo "Links extracted and saved to $output_file"
