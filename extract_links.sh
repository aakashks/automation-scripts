#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 input_file"
    exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="links.txt"

# Empty the output file
> $output_file

# Read the input file line by line
while IFS= read -r line
do
 # Check if the line is a link
 if [[ $line =~ ^https.* ]]; then
   # Get the next to next line
   read -r title
   read -r next_title

   # Format the output and append to the output file
   echo "- [$next_title]($line)" >> $output_file
 fi
done < "$input_file"
