#!/bin/bash

# EXTRACTS LINKS FROM ANY TEXT DOCUMENT AND FETCH THEIR TITLE

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 input_file"
  exit 1
fi

input_file="$1"
output_file="links_${input_file%.*}.md"

# Empty the output file
> $output_file

# Use a regular expression to find links starting with "https" and ending with a space
regex="https[^\ ]+"

while read -r line; do
  if [[ $line =~ $regex ]]; then
    link="${BASH_REMATCH[0]}"
    # echo "- $link" >> "$output_file"

    # Use curl to fetch the HTML content of the URL and grep to extract the title
    title=$(curl -s "$link" | grep -o '<title>[^<]*' | sed 's/<title>//')

    # Write the title and link in the desired format to the output file
    if [ -z "$title" ]; then
        echo "- $link" >> "$output_file"
    else
        echo "- [$title]($link)" >> "$output_file"
    fi
    
  fi
done < "$input_file"

echo "Links extracted and saved to $output_file"
