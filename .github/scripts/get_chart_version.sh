#!/bin/bash

tag=$1

# Check if the input tag has at least three dot characters
if [[ $(echo "$tag" | grep -o "\." | wc -l) -ge 3 ]]; then
  # Replace the hyphen character in the third occurrence of the dot character
  chart_name=$(echo "$tag" | sed -E 's/^(([^.]*\.){2}[^.]*)(\.)([^.]*)(.*)$/\1-\4\5/')
else
  # Print an error message if the input tag does not have at least three dot characters
  echo "Error: The input tag does not formed with "Semantic Versioning" ."
  exit 1
fi

# Print the modified tag if it was successfully modified
if [[ ! -z "$chart_name" ]]; then
  echo "Modified tag: $chart_name"
  echo "chartVersion=$chart_name" >> "$GITHUB_OUTPUT"
else
  echo "Error: The input tag does not formed with "Semantic Versioning" ."
  exit 1
fi
