#!/bin/sh
# Use git to find and remove all .zip files that are older than 90 days
#date=$(date -d '90 days ago' +%Y-%m-%d)
#echo "date:${date}"
git ls-files '*.zip' | while read path junk
do
  output=$(git log --since='90 days ago' -- \"$path\")
  echo "path:${path}: output:${output}:"
  # If there is output, then the file has been created
  # within the window, so do not remove those.
  if [ "${output}" != "" ]; then
    echo "Removing: $path"
    #rm "$path"
  fi
done
