#!/bin/bash

# Check if the user provided a URL as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Define the URL to fetch
url="$1"

# Use curl to fetch the HTML content of the URL and grep to extract the title
title=$(curl -s "$url" | grep -o '<title>[^<]*' | sed 's/<title>//')

# Check if a title was found
if [ -z "$title" ]; then
    echo "No title found for $url."
else
    echo "Title: $title"
fi
