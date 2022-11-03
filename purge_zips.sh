#!/bin/sh
# Use git to find and remove all .zip files that are older than 90 days
date=$(date -d '90 days ago' +%Y-%m-%d)
echo "date:${date}"
git ls-files '*.zip' | while read path junk
do
  output=$(git log --since \"$date\" -- \"$path\")
  #echo "path:${path}: output:${output}:"
  if [ "${output}" = "" ]; then
    echo "Removing: $path"
    rm "$path"
  fi
done
